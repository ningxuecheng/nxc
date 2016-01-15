//
//  main.m
//  C08-内存管理
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
/**定义定义两个全局变量*/




void fun(int x, int y) {

     char string[] = "iphone";

     /** 输出参数地址,和函数内容变量的地址 */
    printf("x: %p\n",&x);
    printf("y: %p\n",&y);
    printf("string: %p\n",string);
}
void fun2();

int main(int argc, const char * argv[]) {
    
#pragma mark - 知识点1 储存区划分
    
#pragma mark ** 栈区
#if 0
    int a = 100; int b = 200;
    printf("栈区地址\n");
    printf("a:%p\n",&a);
    printf("b:%p\n",&b);
    /**栈区是从高到低分配内存*/
    
    /**查看函数参数内存分配问题*/
    
    fun(a, b);
    /** 注意: 调用函数之后,函数的形参先进栈区,然后是函数内的变量进栈区,函数调用
         之后(及执行完函数),出栈的顺序相反,即先释放函数内的变量,在释放形参内存*/
#endif
#pragma mark ** 堆区
#if 0
    
    int *a2 = malloc(4); //
    int *b2 = malloc(4);
    
    printf("堆区地址如下: \n");
    printf("a2: %p\n",a2);
    printf("b2: %p\n",b2);
    
    free(a2); //内存释放
    free(b2); //内存释放
    /**结论 堆内存是从低到高分配 堆内存更多内容,详见知识点2*/
#endif
#pragma mark ** 全局(静态)区
#if 0
    printf("全局取地址如下\n");
   
    
    //定义两个静态变量
    static int s1 = 100;
    static int s2 = 200;
    printf("静态区地址如下\n");
    printf("s1:%p\n",&s1);
    printf("s2:%p\n",&s2);
    

    //结论 全局静态区 内存分配从低到高
#endif
#pragma mark ** 常量区
#if 0
    char *str = "iphone";
    char *str2 = "ios";
    printf("常量区地址:\n");
    printf("%p\n",str);
    printf("%p\n",str2);
#endif
    
#if 0//常量不能更改
    
  char *string = "iphone";

    printf("%c\n",*(string + 1));//通过指针可以任意读取常量值
   *(string + 1) = 'P';  //但是常量值 不能更改 报指针错误
#endif
    
    
#if 0//容易混淆的地方
    
 char *str = "iphone";  //定义了一个指针 指向常量区
 char str2[] = "iphone"; //定义了一个数组,将常量区内容复制到栈区

#endif
    
    
#if 0
 char *str = "iphone";
    printf("地址1 %p",str); //是指针指向的内存地址
    printf("地址2 %p",&str); // 指针本身的内存地址
#endif
#pragma mark ** 代码区
#if 0
    //函数代码通常在代码区
    printf("代码区地址如下\n");
    printf("fun: %p\n",fun);
    printf("main: %p\n",main);
    printf("fun2: %p\n",fun2);
    
   //代码区 从低到高分配内存
#endif
#pragma mark - 知识点2 堆内存分配函数
#if 0
    /**通过函数 malloc 在堆区开辟空间*/
    int *p = malloc(8);
    *p = 100;  //前四个字节赋值
    *(p +1) = 200;
    printf("%d\n",*p); //访问前四个字节的内容
    printf("%d\n",*(p+1)); //访问后四个字节
    printf("%d\n",*(p+2)); //访问正常开辟的8个字节以外的内容 ,注意不能这样写
    
    //通过free函数释放
    free(p);
    printf("%d\n",*p); //此时发现值还是之前的100 结论 free不清空内存
    
     printf("%d\n",*(p+1));
    
    //针对free函数不清空内存问题, 为了不引起野指针问题,通常将指针指向空
    p = NULL;
    
    int *pp = malloc( 5 * sizeof(int));
    *(pp + 0) = 10;
    *(pp + 1) = 6;

    *(pp + 2) = 7;

    *(pp + 3) = 4;

    *(pp + 4) = 5;
    int temp = 0;

   
    
    
    //冒泡排序
    for (int i = 0; i < 5 - 1; i ++) {
        for (int j = 0; j < 5 - 1 - i; j++) {
            if (*(pp + j) > *(pp + j + 1) ) {
                temp = *(pp + j);
                *(pp + j) = *(pp + j + 1);
                *(pp + j + 1) = temp;
            }
        }
    }
    for (int i = 0; i < 5; i++) {
        printf("%d\n",*(pp + i));
    }
    
    
    
    
    
    free(pp);
    pp = NULL;
#endif
#if 0
//    有一已知字符串，其中包含 数字 字符，提取其中的 数字字符 ，要求动态分配内存保存。
//    提示: 先计算出有几个数字字符，然后根据数字字符的个数在堆区开辟空间。
    char str[] = "sdasd31asd53d5df";
    int i = 0;
    int j = 0;
    while ( str[i] !='\0' ) {
        if (str[i] <='9' && str[i] >= '0') {
            str[j] = str[i];
            j++;
        }
        i++;
    }
    
    str[j] = '\0';  //最后一位附上0
    
    char *strnum = malloc( j * sizeof(int) + 1);
    
    for (int i = 0; i < j; i++) {
        *(strnum+i)  = str[i];
    }
    
    for (int i = 0; i < j; i++) {
        printf("%c",*(strnum + i));
    }
    printf("\n");
    printf("%s\n",strnum);
    free(strnum);
    strnum = NULL;
#endif 
#if 0
//    输入3个单词，动态分配内存保存单词，并在最后输出。
//    提示:定义一个指针数组 char * words[3] = {0}； 保存堆区空间的地址，堆区空间存储数据。
    
    char *words[3] = {};
    
    
    for (int i = 0 ; i < 3; i++) {
        
        char str[50] = {};
        printf("请输入单词:\n");
        scanf("%s",str);
        
        
        //堆区开辟空间
        char *newword = malloc((strlen(str) + 1) * sizeof(char));
        
        strcpy(newword, str); //将 str 拷贝到 newword 中
        words[i] = newword; //将指针存入指针数组
        
    }
        for (int i = 0; i < 3; i++) {
            
            printf("%s\n",words[i]);
        }
   
    //堆内存释放
    for (int i = 0; i < 3; i++) {
        free(words[i]);
        words[i] = NULL;
    }
#endif
#pragma mark - 知识点3 其他内存分配函数
    
    
  /** calloc 函数,分配内存并且清零 */
    
    char *p = calloc(4, 5);  // 4 个 5 字节
    
    free(p);
    
    
    
    /** realloc 函数, 对之前分配的内存空间 重新调整新的大小  */
    char *p2 = malloc(10);
    
    char *newp = realloc(p2, 30);
    
    free(newp); //注意 之前的p2是否要释放呢? 详见API
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        return 0;
}


void fun2() {

    printf("asda");

}





