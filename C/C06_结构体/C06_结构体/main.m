//
//  main.m
//  C06_结构体
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

/** typedef 将结构体类型重定义*/
struct ClassRoom {
    float area;
    int floor;
    
};
typedef struct ClassRoom ClassRoom;

typedef struct  Computer {
    float cpu;
    char color[20];

} Computer; //此处的computer为新的类型名



/** 第一种结构体定义写法 通常使用这一种 */


struct Teacher {
    char name[10];
    int age;
    float weight;
    ClassRoom class; //结构体嵌套
};
/***第二种结构体变量的写法*/
struct Driver {
    char name[20];
    char sex;


}dri1,dri2; /**此处的dri1是变量 dri2是变量*/


typedef struct Driver driver;
/**第三种结构体变量的写法 匿名结构体写法*/

struct  {
    char name[20];
    int age;
}englishTeacher; /**englishTeacher 为变量名*/



typedef struct Teacher teacher;


struct ArrStruct{
    int array[5];


};
typedef struct ArrStruct Myarray;

int main(int argc, const char * argv[]) {
#pragma mark - 知识点1 结构定义
#if 0
    /** 结构体语法
     * struct 结构体名 {
     *     类型 成员名;
               .
               .
     
     *    };
       */
    /** 定义一个结构体  */
    struct Student {
        char name[20];  //姓名
        int  age;       //年龄
        int  number;    //学号
        float weight;    // 体重
        
    };
    
    /**定义一个结构体变量
       说明
       其中 struct Student 相当于 int
            stu1 相当于 a  ;
     */
    struct Student stu1 = {"ning",20,44,70.5};
    struct Student stu2 = {"alizee",20,45,60.0};
    struct Student stu3 = {"ads",11,23,45.0};
    /** 通常结构体在函数的外面定义 详见main 函数外面代码 */
    struct Teacher tea1 = {"lolita",20,50};
   // dri1 = {"tom",'m'};  结构体变量不能整体赋值 只能成员单独赋值
                      //注意成员变量如果字符串,需通过strcpy 字符串拷贝函数
    strcpy(dri1.name, "tom");
    englishTeacher.age = 20;
    strcpy(englishTeacher.name, "lili");
#endif
#pragma mark - 知识点2 用typedef定义结构体类型
    /**  typedef 的目的 我了简化类型
         例如:  struct Teacher 简化为 Teacher
                int [] 简化为 Array
         typedef 适用于 任何类型 即可以将任何类型重定义*/
    
    
    //详见 main 函数上面的 结构体
    
    ClassRoom class1 = {100,3};
    
    Computer my = {12.0,"red"};
#pragma mark - 知识点3 结构体变量赋值
#if 0
    teacher tea1 = {"misszhang",30,55};
    teacher tea2 = tea1; //结构体可以直接赋值
    
    printf(" name = %s\n",tea2.name);
    printf("age = %d\n",tea2.age);
    printf("weight = %f\n",tea2.weight);
    /** 数组变量不能直接赋值 */
    int array[5] = {2,54,3,132,0};
    int array1[5] = {};
   // array1 = array; //数组变量不能直接赋值
    
    /**  小技巧: 吧数组作为结构体的一个成员,通过结构体变量赋值,    */
    
    Myarray newarray = {{1,2,2,1,2}};
    Myarray newarray2 = newarray;
    for (int i = 0; i < 5; i++) {
        printf("\n%d",newarray2.array[i]);
    }
   
#endif
#pragma mark - 知识点4 结构体内存的占用
    teacher tea3 = {"lili",20,60};
    printf("size: %lu\n",sizeof(tea3));
#pragma mark - 知识点5 结构体嵌套
    /** 详见main函数上的结构体定义*/
#pragma mark - 知识点6 结构体数组
    /**  结构体数组 就是数组中的元素类型都是数组
         注意: 一个数组中的结构体类型都要相同
     */
    
  
    
    
    driver driver1 = {"tom",'m'};
    driver driver2 = {"james",'s'};
    
    Computer computer1 = {3.5,"white"};
    Computer computer2 = {4.2,"gray"};
    
    
    /** 定义一个结构体数组  */
    
    driver arrdriver[5] = {dri1,dri2,};
    
    /** 结构体数组中的结构体类型必须相同 */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    return 0;
}
