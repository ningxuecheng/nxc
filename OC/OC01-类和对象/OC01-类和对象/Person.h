//
//  Person.h
//  OC01-类和对象
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

/** .h文件版含类的实例变量和方法的声明
     实例变量和方法的声明要在对应的 @interface 和 @end之间*/




@interface Person : NSObject  /** 其中Person是类名,首字母大写 NSObject是
                               父类名 继承会详细介绍
                               */

/**1.类的实例变量 注意,写在{}内*/

{
    
    /** 实例变量可见度: @public @protected @private
     *
     *  @public 公共的,类的内部和外部都可以直接访问
     *
     *  注:类的内部值.m文件@implementation @end 之间
     *
     *  @protected 受保护的 类的内部能访问及子类可以访问
     *
     *  @private 私有的, 只有类得内部可以访问
     *
     *
     *  默认可见度是 : @protected 受保护
     */
    @public   /** 可见度修饰词 修饰直到下一个修饰词之前的实例变量 */
    NSString *_name; //oc中的字符串同样也是对象,NSString 就是字符串对象类型
                    //由于对象是在堆区开辟空间,所以NSString类型的实例变量前面加*
                      //符号(指针),代码规范:实例变量的加_符号 是和后面讲到的属性进行区分
    int _age;
    NSInteger _number;//注意:NSInterger不是对象类型,根据系统环境确定不同的整形类型
    
    
    @private
    float _weight;


}



/**2.类的方法声明 */



/**1.方法前面要加上 + 或 - 符号,分别表示类方法还是对象方法*/
/**2.方法的返回值用()括起来*/
/**3.方法没有参数,后面没有()*/
- (void)sayHello;


/** 1 -对象方法
    2 如果方法带参数, : 后面加上(参数类型)参数名*/
- (void)inforOfPerson: (Person *)person;

- (void)information;


@end
