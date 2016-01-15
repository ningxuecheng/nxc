//
//  kaiClass.m
//  OC01-作业
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "kaiClass.h"

@implementation kaiClass


@end
@implementation LOClassF

-(void) classInfo {
   
    NSLog(@"机构名:%@ 班级名:%@ 班级人数:%d 教师名:%@ 开班日期:%@",_name,_className,num,_teacherName,_date);
}
-(void) activiClass {
    NSLog(@"活动开始");

}
-(void) beginClass {
    NSLog(@"开班仪式正式开始");
}
@end

@implementation Teacher

-(void) jiangKe {
    NSLog(@"讲课");
}
-(void) buZhi {

    NSLog(@"布置");
}
-(void) yanShou {
    NSLog(@"验收");
}
-(void) jieJue {
    NSLog(@"解决");
}
-(void) jieShao {
    NSLog(@"我叫%@ 性别%c 年龄%d 正在教%@",_name,_sex,_age,_subject);
}

@end

@implementation Students
    -(void) jieStu {
    
        NSLog(@"我叫%@ 性别%c 年龄%d 学号%d 爱好是%@",_name,_sex,_age,_sNo,_hobby);
    
    }
@end





