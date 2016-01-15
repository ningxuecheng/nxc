//
//  main.m
//  C02-作业-44-宁学成
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SIZE (5)

int main(int argc, const char * argv[]) {
#pragma mark - 1
#if 0
    {
        int a[SIZE] = {0}, i = 0;
        for(i = 0; i < SIZE; i++)
        {
            a[i] = i + 10;
            printf("a[%d] = %d\n", i, a[i]);
        }
    }
#endif
#pragma mark - 2
#if 0
    {
        int a[SIZE] = {0}, i = 0;
        for(i = 0; i < SIZE; i++)
        {
            a[i] = i + 10;
            printf("a[%d] = %d ", i, a[i]);
        }
        printf("\n");
        for (i = SIZE; i > 0; i--) {
            printf("a[%d] = %d ", i - 1, a[i - 1]);
        }
        
    }
#endif
#pragma mark - 3
#if 0
    {
        int a[SIZE] = {0}, i = 0,add = 0;
        for(i = 0; i < SIZE; i++)
        {
            a[i] = i + 10;
            add = a[i] + add;
            printf("a[%d] = %d ", i, a[i]);
        }
        printf("\n");
        printf("add= %d",add);
        
    }
#endif
#pragma mark - 4
#if 0
    {
        int a[SIZE] = {0}, i = 0,add = 0;
        for(i = 0; i < SIZE; i++)
        {
            a[i] = i + 10;
            add = add - a[i]  ;
            printf("a[%d] = %d ", i, a[i]);
        }
        printf("\n");
        printf("add= %d",add + a[0]);
        
    }
#endif
#pragma mark - 5
#if 0
    //
    {
        int array[20] = {},max = 0,min = 50,avg = 0,add = 0 ;
        for (int i = 0; i < 20; i++) {
            array[i] = arc4random() % (50 - 10 + 1) + 10;
            max = max > array[i] ? max : array[i];
            min = min < array[i] ? min : array[i];
            add = array[i] + add;
            printf("%d ",array[i]);
        }
        avg = add / 20;
        printf("\n");
        printf("max:%d min:%d add:%d avg:%d",max,min,add,avg);
        
    }
#endif
#pragma mark - 6
#if 0
    {
        char array[5] = {0},num[5] = {0},temp = 0, mynum[50] = {0};
        printf("请输入第一个数组:");
        for (int i = 0; i < 5; i++) {
            scanf("%s",&array[i]);
        }
        for (int i = 0; i < 5 - 1; i++) {
            //内层的 for 循环控制每次的比较
            for (int j = 0; j < 5 - i - 1; j++) {
                if (array[j] > array[ j + 1]) {
                    temp = array[j];
                    array[j] = array[ j + 1];
                    array[ j + 1] = temp;
                }
            }
        }
        for (int i = 0; i < 5; i++) {
            printf("%c ",array[i]);
        }
        printf("\n");
        printf("输入第二个数组");
        for (int i = 0; i < 5; i++) {
            scanf("%s",&num[i]);
        }
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 5 - i - 1; j++) {
                if (num[j] > num[j+1]) {
                    temp = num[j];
                    num[j] = num[j+1];
                    num[j+1] = temp;
                }
            }
        }
        for (int i = 0; i < 5; i++) {
            printf("%c ",num[i]);
        }
        printf("\n");
        strcat(mynum, array);
        strcat(mynum, num);
        for (int i = 0; i < 10 - 1; i++) {
            //内层的 for 循环控制每次的比较
            for (int j = 0; j < 10 - i - 1; j++) {
                if (mynum[j] > mynum[ j + 1]) {
                    temp = mynum[j];
                    mynum[j] = mynum[ j + 1];
                    mynum[ j + 1] = temp;
                }
            }
        }
        for (int i = 0; i < 10; i++) {
            printf("%c ",mynum[i]);
        }
    }
#endif
#pragma mark - 7
#if 0
    //给定某年某月某日,输出其为这一年的第几天
    // 1 3 5 7 8 10 12   2 4 6 9 11
    {
        int year[3] = {},day = 0;
        printf("请输入年月日 ");
        for (int i = 0; i < 3; i++) {
            scanf("%d",&year[i]);
         }
        if (year[0] % 400 == 0 || (year[0] % 4 == 0 && year[0] % 100 != 0) ) {
            for (int i = 0; i < year[1] - 1; i++) {
                day += 30;
            }
            
            
            
            
            
            
            
            
            printf("闰年%d",day + year[2]);
            
        }else {
            printf("平年");
        
        }
        
        
        
    }
#endif
#pragma mark - 8
#if 0
    {
        int array[] = {1,4,56,98,8,7,};
        int count = sizeof(array) / sizeof(array[0]);
        int temp = 0;
        int flag = 1;//表示数组无序
        for (int i = 0 ; i < count - 1 && flag == 1; i++) {
            flag = 0;//假设有序
            for (int j = 0; j < count - 1 - i; j++) {
                if (array[j] > array[j+1]) {
                    temp = array[j];
                    array[j] = array[j+1];
                    array[j+1] = temp;
                    flag = 1;  //发生交换说明无序
                }
            }
        }
        for (int i = 0; i < 6; i++) {
            printf("%d ",array[i]);
        }
    }
#endif
#pragma mark - 9
#if 0
    {
        int a[] = {-5,-9,32,77,64,-24,14,0,21,45},max = 0,k = 0,j = 0,min = 100;
        for (int i = 0; i < 10; i++) {
            if (max < a[i]) {
                max = a[i];
                k = i;
            }
            if (min > a[i]) {
                min = a[i];
                j = i;
            }
        }
        printf("max:%d\n i = %d min:%d i = %d\n",max,k,min,j);
        
        
    }
#endif
#pragma mark - 10
#if 1
    {
        char result[50] = {0};
        char str1[] = "Lanou ";
        char str2[] = "23_class "; char str3[] = " is niu best!";
        strcat(result, str1);
        strcat(result, str2);
        strcat(result, str3);
        printf("%s\n",result);
        
    }
#endif
#pragma mark - 11
#if 0
    {/** 3. 倒转字符串"abcdef" */
        char str[] = "abcdef",c = 0;
        for (int i = 6; i > 0; i--) {
            printf("%c",str[i-1]);
        }
        printf("\n");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 6 - i -1; j++) {
                if (str[j] < str[j+1]) {
                    c = str[j];
                    str[j] = str[j+1];
                    str[j+1] = c;
                }
            }
         }
        
        /**更好的方法***/
        
        
        
        
        
        for (int i = 0; i < 6; i++) {
            printf("%c",str[i]);
        }
        printf("\n");
        
    }
#endif
#pragma mark - 12
#if 0
    {/** 将字符串中的数字去掉“a12b3c45d78"*/ //注意比较字符串的格式 '' <> ''
        
        //双地址
       char str[] = "a12b3c45d78";
        for (int i = 0; i < 11; i++) {
            if (str[i] <= '9' && str[i] >='0' ) {
                str[i] = ' ';
            }
            printf("%c",str[i]);
        }
        printf("\n");
    }
#endif
#pragma mark - 13 **注意看
#if 0
    {/** 编程在一个已知的字符串中找最长单词，假定字符串中只含字母和空格，空格用来分隔不同单词。
      比如："ni hao world",最长单词是world */
        char str[] = "Lanouing 23_class is niu best!",num[20] ={},max[20] = {};
        int k = 0;
        int count = 0;
        int i = 0;
        while (str[i] != '\0') {
            if (str[i] != ' ') {
                num[count] = str[i];   //切记字符串赋值时一定要开辟空间
                count++;
                if (count > k) {
                    strcpy(max, num);   //开辟空间
                    k = count;
                }
             }else{    //重新给num[]赋值 为空格后的单词
                count = 0;
            }
            i++;
        }
        for (int i = 0 ; i < k ; i++) {
            printf("%c",max[i]);
        }
        printf("\n");
     }
#endif
#pragma mark - 14
#if 0
    /**.模拟n个人参加选举的过程，并输出选举结果.
     假设候选人有四人，分别用A、B、C、D表示，当选某候选人时，直接输入其编号(编号由计算机随机产生)，
     若输入的不是A、B、C、D则视为无效票，选举结束后按得票数从高到低输出候选人编号和所得票数。
     假设有100人进行投票*/
    {
        char array[100] = {};
        
        int  num1 = 0,num2 = 0,num3 = 0,num4 = 0;
        int a[5] = {},b[5]={},c[5]={},d[5]={};
       
        for ( int i = 0  ; i < 5; i++) {
            
            a[i] = arc4random() % (9 - 0 + 1) + 0 ;
            b[i] = arc4random() % (9 - 0 + 1) + 0;
            c[i] = arc4random() % (9 - 0 + 1) + 0;
            d[i] = arc4random() % (9 - 0 + 1) + 0;
        
        }
        printf("a: ");
        for (int i = 0; i < 5; i++) {
            printf("%d",a[i]);
        }
        printf("\n");
        printf("b: ");
        for (int i = 0; i < 5; i++) {
            printf("%d",b[i]);
        }
        printf("\n");
        printf("c: ");
        for (int i = 0; i < 5; i++) {
            printf("%d",c[i]);
        }
        printf("\n");
        printf("d: ");
        for (int i = 0; i < 5; i++) {
            printf("%d",d[i]);
        }
        printf("\n");
        
        printf("请投票:\n");
        for (int i = 0; i < 100; i++) {
            scanf("%c",&array[i]);
        }
        printf("投票结束\n");
        for (int i = 0; i < 100; i++) {
            if (array[i] == 'A') {
                num1 = num1 + 1; //a
            }else if (array[i] == 'B'){
                num2 = num2 + 1; //B
            }else if (array[i] == 'C'){
                num3 = num3 + 1;//c
            }else if (array[i] == 'D'){
                num4 = num4 + 1;//D
            
            }
        }
        int man[4] = {0,0,0,0},temp = 0;
        int number [4] = {}, temp2 = 0;
        man[0] = num1;
        man[1] = num2;
        man[2] = num3;
        man[3] = num4;
        
        number[0] = a[0] * 10000 + a[1] * 1000 + a[2] * 100 + a[3] * 10 + a[4] * 1;
        number[1] = b[0] * 10000 + b[1] * 1000 + b[2] * 100 + b[3] * 10 + b[4] * 1;
        number[2] = c[0] * 10000 + c[1] * 1000 + c[2] * 100 + c[3] * 10 + c[4] * 1;
        number[3] = d[0] * 10000 + d[1] * 1000 + d[2] * 100 + d[3] * 10 + d[4] * 1;
        
        
        
        
        for ( int i = 0; i < 4 - 1; i++) {
            for (int j = 0 ; j < 4 - 1 - i; j++) {
                if (man[j] < man[j+1]) {
                    temp = man[j];
                    man[j] = man[j+1];
                    man[j+1] = temp;
                    
                    temp2 = number[j];
                    number[j] = number[j+1];
                    number[j+1] = temp2;
                    
                }
            }
        }
        
        for (int i = 0; i < 4; i++) {
            printf("%d ",number[i]);
            printf("%d \n",man[i]);
            
        }
        
    
    
    
    }
#endif
#if 0
    
    int array[] = {3,5,2,6,1,4};
    int count = sizeof(array) / sizeof(array[1]);
    int temp = 0;
    
    
    
    for (int i = 0; i< count - 1; i++) {
        for (int j = 0; j< count -i- 1; j++) {
            if (array[j] > array[j+1]) {
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
    
    
    
    
    
    
    
    
        for (int i = 0; i < 6; i++) {
        printf("%d ",array[i]);
      }


#endif
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

 
    
    return 0;
}
