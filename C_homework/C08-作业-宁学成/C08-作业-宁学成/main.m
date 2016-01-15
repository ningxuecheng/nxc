//
//  main.m
//  C08-作业-宁学成
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
#if 0
//    输入一个整型数组长度 ,动态创建数组存储整数,所有元素随机生成,输出元素中的最大值。
    int a = 0;
    int temp = 0;
    printf("请输入数组长度:\n");
    scanf("%d",&a);
    
    int *p = malloc(a * sizeof(int));
    
    
    for (int i = 0; i < a; i++) {
        *(p + i) = arc4random() % (100 - 1 + 1) + 1;
        printf("%d ",*(p+i));
        if (*(p + i) > *p ) {
            temp = *(p + i);
            *(p+i) = *p;
            *p = temp;
        }
    }
    printf("\n 最大值是:%d\n",*p);
    free(p);
    p = NULL;
#endif
#if 1
//    已知一个数组有20个整型元素(随机1到100之间包含1和 100),求大于平均数的元素个数,并动态生成一个新数组保存大于平均数的元素.
//    
//    (提示:需要先计算大于平均数的元素的个数,然后动态分配空间)。
    
    int array[20] = {}, max = 0,avg = 0;
    int count = 0;
    for (int i = 0; i < 20; i++) {
        array[i] = arc4random() % (100 - 1 + 1) + 1;
        printf("%d ",array[i]);
        max += array[i];
    }
    printf("\n");
    
    avg = max / 20 ;
    printf("平均值: %d\n",avg);
    
    for (int i = 0; i < 20; i++) {
        if (array[i] > avg) {
            count++;
        }
    }
    printf("个数 %d\n",count);
    int *newArr = malloc(count * sizeof(int));
    
    for (int i = 0; i < 20; i++) {
        if (array[i] > avg) {
            *(newArr+i) = array[i];
            printf("%d ",*(newArr + i));
        }
    }
    printf("\n");
    
    free(newArr);
    newArr = NULL;
    
    
    
#endif
    
    
        return 0;
}
