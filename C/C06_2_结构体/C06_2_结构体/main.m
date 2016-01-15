//
//  main.m
//  C06_2_结构体
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h" // 导入头文件

int main(int argc, const char * argv[]) {
   
    /**  定义person结构体变量    */
    
    Person per1 = {"zhang",20,'m',1};
    
    Person per2 = {"lisi",19,'f',2};
    Person per3 = {"wang",21,'m',3};
    
    informationOfPerson(per1);
    informationOfPerson(per2);
    
    Person array[3] = {per1,per2,per3};
    Person temp = {};
    for (int i = 0; i < 2; i++) {
        for (int j = 0;  j < 2 - i; j++) {
            if (array[j].age > array[j+1].age) {
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
    
    for (int i = 0; i < 3; i++) {
        informationOfPerson(array[i]);
    }
    
    printf("\n");
    
    
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2 - i; j++) {
            if (strcmp(array[j].name, array[j+1].name) > 0) {
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
    
    for (int i = 0; i < 3; i++) {
        informationOfPerson(array[i]);
    }
    
    printf("\n");

    hello();
    
    return 0;
}
