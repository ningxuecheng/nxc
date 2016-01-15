//
//  main.m
//  C03_循环结构
//
//  Created by dllo on 15/11/19.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
#pragma mark - 知识点1 for 循环
    {
#if 0
        for (<#initialization#>(变量初始化); <#condition#>(条件表达式); <#increment#>(变量的增量)) {
            <#statements#>(循环体语句)
        }
        流程:
        1,变量的初始化
        2,判断条件表达式(真或假)
        3,如果条件表达式为真,执行循环体语句
        4,执行变量增量
        5.再次判断条件表达式
        6,如果此时表达式为假,退出整个循环体
#endif
#if 0
        /**
         * 练习1: 打印5次"hello, lanou!"
         */
        int i = 0;
        for (i = 0; i < 5; i++) {
            printf("hello word \n");
        }
#endif
#if 0
        /**
         * 练习2: 正序打印1 - 5"
         */
        int i = 0,a = 0;
        for (i = 0; i < 5; i++) {
            a = a + 1;
            printf("a: %d \n",a);
        }
#endif
#if 0
        /**
         * 练习3: 到序打印1 - 5"
         */
        int i = 0,a = 6;
        for (i = 0; i < 5; i++) {
            a = a - 1;
            printf("a: %d \n",a);
        }
#endif
#if 0
        /**
         * 练习4: 打印1 - 100间的偶数"
         */
        int i = 0;
        for (i = 1; i < 100; i++) {
            
            if (i % 2 == 0) {
                 printf("i: %d \n",i);
            }
           
        }
#endif
#if 0
        /**
         * 练习4:
         * 用for循环打印出1~100之间7的倍数。
         * 用for循环打印出1~100之间个位为7的数。
         * 用for循环打印出1~100之间十位为7的数。
         * 用for循环打印出1~100之间既不是7的倍数并且也不包含7的数。
         
         提示:
         如何获取一个数a的个位?   a  % 10
         如何获取一个数a的十位?   a   /  10
         */
#if 0
        int i = 0;
        for (i = 1; i < 100; i++) {
            if (i % 7 == 0) {
                printf("%d \n",i);
            }
        }
#endif
#if 0
        int i = 0;
        for (i = 1; i < 100; i++) {
            if (i % 10 == 7) {
                printf("%d \n",i);
            }
        }
        
#endif
#if 0
        int i = 0;
        for (i = 1; i < 100; i++) {
            if (i / 10 == 7) {
                printf("%d \n",i);
            }
        }
        
#endif
#if 0
        int i = 0;
        for (i = 1; i < 100; i++) {
            if ((i % 10 != 7) && ( i / 10 != 7) && ( i % 7 != 0)) {
                printf("%d \n",i);
            }
        }
        
#endif
        
        
#endif
     
    

    }
#pragma mark ** 练习
#pragma mark - 知识点2 break , continue
#if 0
    {
        
        
    /** 
     break 退出循环
     continue 退出一次循环
     
     */
        
        
        
    }
#endif
#pragma mark ** 练习
    {
#if 0
        /** break
         * 练习1: 判断一个数是否是质数
         *
         * 注: 任何一个数都能被1和它本身整除, 就看该数能否被2到本身-1的数整除即可. 如果能够整除,说明不是质数
         */
        int a = 0,i = 0;
        BOOL isZhi = NO;
        printf("输入有一个数: \n");
        scanf("%d",&a);
        for ( i  = 2; i < a; i++) {
            if( a % i ==0){
                isZhi = NO;
                break;
            }else {
                isZhi = YES;
               
            }
        }
        if (isZhi == YES) {
            printf("是质数");
        }else {
            printf("不是质数");
        }
        
#endif
    
    
    }
#pragma mark - 知识点3 随机数
#if 0
    {
        /**公式 arc4Random() % (b - a + 1) + a */
        
    }
#endif
#pragma mark ** 练习
#if 0
    {
      /***/
        int a = 1, b = 10 ,max = 10,min = 30;
        for (a = 0; a < 10; a++) {
            b = arc4random() % (30 - 10 + 1) + 10;
            max = max > b ? max : b;
            min = min < b ? min : b;
            printf("%d: %d \n",a,b);
            
        }
        printf( "max: %d\n",max);
        printf("min: %d\n",min);
    
      
    }
#endif
#pragma mark - 知识点4 while 循环
#if 0
    {
        
        while () {
            <#statements#>
        }
        1.判断表达式
        2.如果表达式为真,执行语句
        3.再次判断表达式,
        
        
        
        
        
    }
#endif
#pragma mark ** 练习
    {

        /**
         * 练习1:
         * 用while循环打印出1~100之间7的倍数。
         * 用while循环打印出1~100之间个位为7的数。
         * 用while循环打印出1~100之间十位为7的数。
         * 用while循环打印出1~100之间既不是7的倍数并且也不包含7的数。
         */
#if 0
        int i = 1;
        while (i <=100) {
            if (i % 7 ==0) {
                printf("%d \n",i);
            }
            i = i + 1;
        }
        
        
#endif
#if 0
        int i = 0;
        while (i <= 100) {
            if (i % 10 == 7) {
                printf("%d \n",i);
            }
            i++;
        }
#endif
#if 0
        int i = 0;
        while (i <= 100) {
            if (i / 10 == 7) {
                printf("%d \n",i);
            }
            i++;
        }
#endif
#if 0
        int j = 0,i = 0;
        while (i == 0) {
            
            printf("请输入一个数:\n");
            scanf("%d",&j);
            printf("输入的是:%d\n",j);
            if (j == 0) {
                i = 1;
                printf("退出程序");   /**break 跳出循环  return 0 跳出主函数 main(); 程序结束 */
            }
        }
#endif
#if 0
        int j = 0,i = 0;
        BOOL isZhi = NO;
        while (i == 0) {
            printf("请输入一个数判断是否为质数:\n");
            scanf("%d",&j);
            printf("输入的是:%d\n",j);
            if (j == 0) {
                printf("跳出循环\n");
                break;   /**break 跳出循环  return 0 跳出主函数 main(); 程序结束 */
            }
           
            if (j != 0)
            {
                for (int k = 2;k < j ; k++) {
                    if (j % k == 0) {
                        isZhi = NO;
                        break;  //跳出本层(for)循环 不跳出(while)循环
                    }
                    else {
                        isZhi = YES;
                    }
                }
                if (isZhi == NO) {
                    printf("数字: %d 不是质数\n",j);
                }else{
                    printf("数字: %d 是质数\n",j);
                }
            }
        }
#endif
    
    }
#pragma mark - 循环嵌套练习
    {
#if 0
        /**
         * 练习1: 打印一行 1, 2, 3, 4, 5
         */
        for (int i = 0; i < 5; i++) {
            printf("%d,",i+1);
        }
    
#endif
#if 0
        /**
         * 练习2: 打印三行 1, 2, 3, 4, 5
         */
        
        for (int o = 0; o < 3; o++) {  // 确定三行
            
            for (int i = 0; i < 5; i++) {  //每行的输出
                printf("%d,",i+1);
                
            }
            printf("\n");  //每行结束时的换行 \n
        }
        
#endif
#if 0
        /**
         * 练习3: 打印如下图形：
         1
         1 2
         1 2 3
         1 2 3 4
         1 2 3 4 5
         */
        for (int i = 0; i < 5; i++) {
            int j = 0;
            
            for (j = 0; j < i + 1; j++) {
                printf("%d", j + 1);
                
            }
            printf("\n");
            
            
        }
        printf("-------- \n");
        /**
         * 练习4: 打印如下图形：
         1 2 3 4 5
         1 2 3 4
         1 2 3
         1 2
         1
         */
        
        for ( int i = 0; i < 5; i++) {
          int    j = 0;
            
            for (j = 0; j < 5 - i; j++) {
                printf("%d", j + 1 );
                
            }
            printf("\n");
            
            
        }
        /** 9 * 9 乘法表*/
        for (int i = 0; i < 9 ; i++) {
            
            
            for (int j = 0; j < i + 1; j++) {
                printf("%d*%d=%-2d",j + 1 ,i + 1,(i + 1) * ( j + 1));
                printf(" ");
            }
            printf("\n");
        }
        
        
        
#endif
#if 0
        int i = 0, j = 0 ,k = 0  ;
        for (i = 1; i < 10; i++) {
            for (j = 0; j <= 9 ; j++) {
                for (k = 0; k <= 9; k++) {
                    printf("%d%d%d ",i,j,k);
                }
                printf("\n");
            }
            
        }
        
        
        
        
#endif

       
        
 
        

        
    }

#pragma mark - 知识点5 do...while
    {
#if 1
        int count , p ;
        printf("输入一个数:\n");
        scanf("%d",&p);
        do {
            p = p / 10;
            count = count + 1;
        } while ( p );
        
        printf("是%d位数\n",count);
        
        
        
#endif
   }
#pragma mark ** 练习
        return 0;
}
