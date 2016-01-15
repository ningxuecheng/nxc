//
//  main.m
//  C04-数组
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义宏
#define PI 3.1415
//定义带参数的宏
#define MUL(A, B) ((A) * (B)) /** 两个数的积的宏*/
int main(int argc, const char * argv[]) {
#pragma mark - 知识点1 一维数组
    {
#if 0
        /**定义一个一位数组*/
        
        int array[5] ={0, 1, 2, 3, 4};
        /** array 数组名
         *  int [] 数组类型
         *  int: 数组中的元素类型
         *  [5] 元素的个数
         *
         */
        // 1.整形数组  数组元素都是整形
        int  array1[3] = {1,2,3};
        // 2.浮点型数组 数组元素都是浮点型
        float array2[3] = {1.1,2.2,3.3};
        // 3.字符型数组 数组元素都是字符型
        char array3[5] = {'a','d','s','f','x'};
        // 4.指针数组  数组元素都是指针
        
        /** 数组元素的访问
         * 通过下标的形式, array[ 下标 ]
         *
         *
         *
         */
        
        /**数组元素赋值*/
        int ant[5] = {};
        ant[0] = 0;
        ant[1] = 1;
        ant[2] = 2;
        ant[3] = 3;
        ant[4] = 4;
        
       
        //使用 for 循环输出每个元素
        for (int i = 0; i < 5; i++) {
            printf("%d\n",ant[i]);
        }
        
        
        
        
        
        
        
#endif
    }
#pragma mark ** 练习
    {
#if 0
        /**
         * 1. 输入5个数, 计算找出最大值和所有元素的和
         */
        int num[5] = {0};
        int max = 0,and = 0;
        printf("请输入5个数\n");
        for (int i = 0; i < 5 ; i++) {
            scanf("%d",&num[i]);
        }
        for (int i = 0; i < 5; i++) {
            max = max > num[i] ? max : num[i];
            and = num[i] + and;
            
        }
        printf("最大值:%d\n",max);
        printf("和是: %d\n",and);
        
        
#endif
#if 0        /**
         * 2. 定义一个具有 20个元素 的 整型数组，每个元素的 取值范围是30-70之间，求 数组元素的和
         */
        int num[20] = {0},max = 0;
        for (int i = 0; i < 20 ; i++) {
            num[i] = arc4random() % (70 - 30 + 1) + 30;
            max += num[i];
            printf("数:%d ",num[i]);
        }
        printf("\n");
        printf("max:%d\n",max);
        
        
#endif
#if 0
        /**
         * 3.复制一个数组，即两个数组 容量一样，把其中一个数组中的元素 复制 到另外一个数组中
         
         */
        int num1[5] = {1,2,3,4,5};
        int num2[5] = {0};
        for (int i = 0; i < 5; i++) {
            num2[i] = num1[i];
            printf("%d\n",num2[i]);
        }
        
#endif
#if 0
        /**
         * 5.整形数组的长度20,随机数范围35 - 90, 找到数组中最大的元素的值和它所对应的下标
         */
        int num[20] = {},max = 0,k = 0;
        for (int i = 0; i < 20; i++) {
            num[i] = arc4random() % (90 - 35 + 1) + 35;
            printf("%d ",num[i]);
           
            if ( num[i] > max) {
                max = num[i];
                k = i ;
            }
        }
      
        printf("最大值:%d 对应下标:%d\n",max,k);
        
#endif
        
    }
#pragma mark - 知识点2 数组排序(冒泡排序)
    {
#if 0
        /**
         *（1）、定义一个6个整型的数组，让奇偶位元素的值交换。
         *（2）、定义一个6个整型的数组，如果奇位比偶位元素的值大，则交换两个数的值。
         *（3）、定义一个6个整型的数组，通过俩俩比较把最大值放在后面，实现最大值放在最后。
         *（4）、在上题的基础上把倒数第二大的数字放在倒数第二位。（别再原来的for循环上操作，新创建一个for循环）
         *（5）、把第三大的数字放在倒数第三位上。
         *（6）、把第四大的数字放在倒数第三位上。
         *（7）、把第五大的数字放在倒数第三位上。
         *（8）、观察上面的规律，用双层for循环把数组排序。
         */
        int array[6] = {3,4,5,6,7,8};
        int temp = 0;
        for (int i = 0; i < 6; i+= 2) {
            temp = array[i];
            array[i] = array[i + 1];
            array[i + 1] = temp;
        }
        for (int i  = 0; i < 6; i++) {
            printf("%d ",array[i]);
        }
        printf("------\n");
        for (int i = 0; i < 6 ; i += 2) {
            if (array[i] > array[i+1]) {
                temp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = temp;
            }
           
        }
        for (int i  = 0; i < 6; i++) {
            printf("%d ",array[i]);
        }
        
        
#endif
#if 0
        //定义一个6个整型的数组，通过俩俩比较把最大值放在后面，实现最大值放在最后。
        int array[6] = {5,6,9,5,8,7};
        int temp = 0;
        /** 第一次比较5次 */
        for (int i = 0; i < 6 - 1; i ++) {
            if (array[i] > array[i+1]) {
                temp = array[i];
                array[i] = array[i+1];
                array[i+1] = temp;
            }
        }
        /** 两两比较,找出第二大的数放在倒数第二 */
        for (int i = 0; i < 6 - 2; i++) {
            if (array[i] > array[ i + 1]) {
                temp = array[i];
                array[i] = array[ i + 1];
                array[ i + 1] = temp;
            }
        }
        /** 第三次比较 比较3次 */
        for (int i = 0; i < 6 - 3; i++) {
            if (array[i] > array[ i + 1]) {
                temp = array[i];
                array[i] = array[ i + 1];
                array[ i + 1] = temp;
            }
        }
        /** 第四次比较 比较 2 次 */
        for (int i = 0; i < 6 - 4; i++) {
            if (array[i] > array[ i + 1]) {
                temp = array[i];
                array[i] = array[ i + 1];
                array[ i + 1] = temp;
            }
        }
#endif
#if 0
        /** BubbleSort冒泡排序*/
        
        int array[6] = {10,6,9,5,4,2};
        int temp = 0;
        /** 外层的 for循环控制比较的次数  */
        for (int i = 0; i < 6 - 1; i++) {
            //内层的 for 循环控制每次的比较
            for (int j = 0; j < 6 - i - 1; j++) {
                if (array[j] > array[ j + 1]) {
                    temp = array[j];
                    array[j] = array[ j + 1];
                    array[ j + 1] = temp;
                }
            }
        }
        for (int i = 0; i < 6; i++) {
            printf("%d ",array[i]);
        }
        
        /** 冒泡排序无注释版*/
        int array1[6] = {10,6,9,5,4,2};
        int temp1 = 0;
        for (int i = 0; i < 6 - 1; i++) {
            for (int j = 0; j < 6 - i - 1; j++) {
                if (array1[j] > array1[ j+1 ] ) {
                    temp1 = array1[j];
                    array1[j] = array1[j + 1];
                    array1[j+ 1 ] = temp1;
                }
            }
        }
        for (int i = 0; i < 6; i++) {
            printf("%d ",array1[i]);
        }
#endif
#if 0
        /** 计算数组元素个数 */
        int array[] = {3,4,2,1,};
        /** 计算数组的字节数 */
        printf("%lu\n",sizeof(array));
        //计算数组个数
        int count = sizeof(array) / sizeof( int );
        printf("count:%d \n ",count);
        //数组的总字节数 / 第一个字节数 = 数组个数
        
        int count1 = sizeof(array) / sizeof(array[0]);
        printf("count1:%d\n",count1);
#endif
#pragma mark ** 冒泡排序优化
#if 0
        
    
        int array[] = {3,5,2,6,1,4};
        int count = sizeof(array) / sizeof(array[1]);
        int temp = 0;
        int flag = 1; // 1表示数组无序
        
        for (int i = 0; i < count - 1 && flag == 1 ; i++) {
            
            flag = 0; //  0 假设是有序
            for (int j = 0; j < count - 1 - i; j++) {
                if (array[j]>array[ j+ 1]) {
                    temp = array[j];
                    array[j] = array[j+1];
                    array[j+1] = temp;
                    flag = 1; // 发生交换,说明无序,讲 flag 赋值为1
                }
            }
        }
        for (int i = 0; i < 6; i++) {
            printf("%d ",array[i]);
        }
        
        
#endif
        
    }
    

#pragma mark - 知识点3
    {
#if 0
        /** 字符数组是一维数组,数组元素是字符类型
         *  (char)
         */
        //定义字符数组
        char string[5] = {'a','b','c','d','e'};
        //字符数组所占的字节数
        printf("%lu\n",sizeof(string));
        
        char string2[10] ={'i','O','S'};
        printf("%lu\n",sizeof(string2));
        
        /**注意 双引号" " 定义的字符数组,在数组的最后一位,系统会自动添加一个 \0
         所以,整个字符数组所占的字节数会多一个字节*/
        char string3[] = "iphone";
        printf("sss");
        printf("%lu\n",sizeof(string3));
        
        /**字符串常用函数*/
        char string4[] ="iphone6splus";
        /** 函数1 strlen(),计算字符串长度   */
        printf("%lu\n",strlen(string4)); //长度
        printf("%lu\n",sizeof(string4)); // 字节数
        
        /** 函数2 strcpy(),字符串拷贝*/
        /** 函数3 strcat 字符串拼接   */
        /** 函数3 strcmp() 字符串比较    */
        
        
#endif
    
    }
#pragma mark ** 练习
    {
#if 0
        char str[] = "i love ios, i want an iphone6s";
       
        int count = 0;
        int i = 0;
        while (str[i] != '\0') {
            if (str[i] == ' ') {
                count++;
            }
            i++;
        }
        printf("%d\n",count);
        
#endif
#if 0
        char str[] = "iphone";
        char str2[] = "iOS";
        
        
        
        /** %s输出字符串 直到遇到\0 停止输出     */
        strcpy(str2, str);
        printf("%s\n",str2);
        
        printf("sdas");
        
#endif
#if 0
        char str[] = "iphone";
        char str2[20] = "iOS";
        
        strcat(str2, str); //str 拼接在 str2的后边
        printf("%s\n",str2);
        
        printf("sdas");
        
#endif
#if 0
        char str[] = "abc";
        char str2[] = "acc";
        //函数有一个返回值, 通过返回值来判断
        // strcmp 是两个字符串从第一个字节开始比较 不同就停止 值为ASCII值之差 根据值得正负判断大小
        
        int result = strcmp(str, str2);
        printf("%d\n",result);
        
        printf("sdas");
        
#endif
    
    }
#pragma mark - 知识点4 宏
    {
        /** 宏定义通常是在函数的外边定义  */


        printf("%f\n",PI);
        MUL(3, 5);
        printf("%d",MUL(3, 5));
        
        
#if 0
        
        
        
                
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
#endif
    }
    return 0;
}
