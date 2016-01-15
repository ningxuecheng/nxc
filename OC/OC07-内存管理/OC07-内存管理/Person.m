//
//  Person.m
//  OC07-内存管理
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name = _name;

/** 重写dealloc方法 */

-(void)dealloc {
  
    [_name release];
    [_sex release];
    [super dealloc];/** 最后一条语句一定是调用父类的dealloc方法,释放内存 */

}


/** _name setter 方法的实现 */

- (void)setName:(NSString *)name {

    if (_name != name) {
        [_name release];
        _name = [name retain];
    }

}

/** _name getter 方法的实现 */

-(NSString *)name {

    return [[_name retain] autorelease];

}

/** _age setter 方法实现 */

- (void)setAge:(NSInteger)age {

    _age = age;

}


/** 构造器 */
+ (instancetype)person {
    
    Person *person = [[Person alloc] init];
    return [person autorelease];
    
}

/** 初始化方法中 实例变量的写法问题 **/

- (instancetype)initWithName:(NSString *)name {

    self = [super init];
    
    if (self) {
        
        _name = [name copy]; /** Apple 官方写法 */ 
        
    }
    
    
    
    return self;


}


@end
