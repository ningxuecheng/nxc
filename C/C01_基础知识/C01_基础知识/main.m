//
//  main.m
//  C01_基础知识
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 dllo. All rights reserved.
//
/** */
//
/**导入founation框架*/
#import <Foundation/Foundation.h>

/** 
 *主函数 一个程序只有一个主函数(main),程序都是从主函数main进入
 *@param argc 参数的个数
 *@param argc[]参数的值(数组)
 *
 *return int 整型
 */
int main(int argc, const char * argv[]) {
   
#pragma mark - 知识点1  进制
    /** 进制转换( 二进制 转换 十进制 )
     *-
     *
     *
     *
     *
     *
     *
     */
    
#pragma mark - 知识点2 基本类型

#if 0  /** 条件编译*/
    
    /**几种基本数据类型*/
    
    
    /** char类型，  占一个字节*/
    char c = 'a';
    printf("c size :%ld\n",sizeof(char));//输出 c 的字节数
    /** int类型（整形}， 占4个字节*/
    int a = 100;
    printf("a size :%ld\n",sizeof(int));
    /**float 类型（浮点类型），占4个字节*/
    float f = 3.14f;
    
    
    
    /*短整型*/
    short s = 200;
    /*长整形*/
    long l = 500;
    /** double 类型 */
    double d = 3.115;
#endif

    
#if 0 /** 变量和常量*/
    /** 变量的命名规范
     *只能以数字,字母,_,$组成,不能以数字开头
     *见名知意
     *驼峰命名,多个单词组成时,后面的单词首字母大写,如:withName
     */
    /**定义整形变量 a 并负值100*/
    int a = 100;
    int b = 200;
    
       /**输出 a*/
    printf("a:%d\n",a);
    
    printf("b:%d\n",b);
    
    printf("over!");
    
    
#endif
#if 0/** 变量和常量*/
    
   /**
    *栈区从高到低分配内存
    *栈区内存由系统管理(开辟和回收)
    */
    int a = 100;
    int b = 200;
    
   
    printf("a:%d\nb:%d\n",a,b);
    
   
    
    printf("over!");
    
    
#endif
#if 0 //*练习交换两个 int 变量的值
    int a = 1;
    int b = 2;
    int c = 0;
    c = b;
    b = a;
    a = c;
    printf("a:%d\nb:%d\n",a,b);
#endif
#if 0/**char 型*/
    /**本质为整型 只有一个字节*/
    char c = 'a'; /**字符用 ''*/
    printf("c: %c\n",c);
    printf("c: %d\n",c);
    
#endif
#pragma mark - 知识点3 运算符
#if 0
  /** = 为赋值运算符 */
    
    /**  算数运算符 */
    int a = 100;
    int b = 12;
    //b = a / 0;除数为零报错
    
    /*printf("a+b=:%d\n", a + b);
    printf("a-b=:%d\n", a - b);
    printf("a*b=:%d\n", a * b);
    printf("a 除以 b = %d\n", a / b);
    printf("a 对 b 取于 = %d\n", a % b);
     */
    
    
    /** ++,-- 自增,自减 */
    int c = 0, d = 0;
    c = a++;
    printf("c:%d, a:%d\n",c,a);
    d = ++a;
    printf("d:%d,a:%d\n",d,a);
    
    
    /**复合运算符
     * a += b 相当于 a = a + b
     */
    printf("a= %d\n", a += b);
#endif
    
#pragma mark - 知识点4 格式化输出
#if 0
    
  
    
    /**
     *printf(<#const char *restrict, ...#>)是函数,我们通过函数实现输出
    */
    int a = 100;
    int b = 20000;
    printf("printf函数, 打印输出引号之间的内容\n");
    printf("sdasda\t\n");
    printf("\\ \n");
    printf("%% \n");
    printf("a:%d,b:%d\n", a , b);
    printf("a:%5d\nb:%5d\n",a,b); //5的含义是占5位不够用空格补齐
    printf("a:%05d\nb:%05d\n",a,b); //5的含义是占5位不够用0补齐
    printf("a:%-5d\n",a);  // -4 左对齐
    
    float f = 3.1415;
    printf("f:%f",f); //默认6位小数
    printf("f:%.2f\n",f); //保留2位小数
    float number1 = 1;
    float number2 = 2;
    printf("number1/number2:%.2f\n",number1 / number2);
    printf("number1/number2:%g\n",number1 / number2); //%g 自动保留小数点位数

#endif
#pragma mark - 知识点5 格式化输入
#if 0
 
    
    int a = 0;
    printf("a 的内存地址为:%p",&a);
    printf("请输入整数 a\n");
    scanf("%d",&a); /** & 符号,取址(取出内存地址)*/
    printf("a = %d\n",a);
    
    
#endif
#if 0
    /** 连续输入 */
    int a = 0;
    int b = 0;
    printf("请输入两个整数:");
    scanf("%d-%d",&a,&b); /** 注意: 格式化输入,要和""之间的定义的格式输入一致*/
    //scanf("%d\n",&a);//注意 scanf后面不能有\n;
    printf("a = %d,b = %d ",a,b);
    
#endif
#if 0
    int a = 0 ;
    int b = 0 ;
    
    printf("请输入两个数\n");
    scanf("%d%d",&a,&b);
    printf("a:%d,b:%d\n",a,b);
    printf("a+b = %d\n",a + b );
    
    
#endif
#if 1

   
    
    
    int a = 1,b = 2,c = a;
    a = b;
    b = c;
    printf("%d%d",a,b);

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#endif
    
    
    
    
    
    
    
    
    
    
    return 0;
}
/**
 printf printf printfprintfprintfprintf
 int printfprintfprintfprintfprintfprintfprintfprintfprintfprintf[rintf[rintf[rintfprintfprintfprintfprintfprintfprintfprintfprintfprintfprintfprintfprintf
 printf{"a:%d\n",a};printfprintfprintfprintfprintf[rintf[rintf
 printf{"a:%d\n",b}
 */