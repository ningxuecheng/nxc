//
//  PasserSAX.m
//  UI17_XML_JSON
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "PasserSAX.h"
#import "ModelForStudent.h"
@interface PasserSAX ()<NSXMLParserDelegate>
@property (nonatomic, retain) NSMutableArray *array;
//保存标签的值
@property (nonatomic, copy) NSString *content;
@end

@implementation PasserSAX


- (NSArray *)passerSAXWithFile:(NSString *)filePath {
    self.array = [NSMutableArray array];
    //NSXMLParser
    NSXMLParser *xmlPar = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfFile:filePath]];
     //数据通过协议回调回来的
    xmlPar.delegate = self;
     //开始解析
    [xmlPar parse];
    return self.array;
}


#pragma mark - xmlParser协议方法

/** 读到开设标签的时候，调用此方法**/
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    NSLog(@"start:%@",elementName);
    
    //读到<student>子标签时
    if ([elementName isEqualToString:@"student"]) {
        ModelForStudent *mod = [[ModelForStudent alloc] init];
        
        [self.array addObject:mod];
    }
    

}
/** 读到标签之间的值的时候，调用此方法 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {


    NSLog(@"string:%@",string);
    self.content = string;

}

/** 读到结束标签的时候调用此方法 */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //从数组中指向最后一个对象
    ModelForStudent *model = [self.array lastObject];
    NSLog(@"end:%@",elementName);
    if ([elementName isEqualToString:@"name"]) {
        model.name = self.content;
    } else if ([elementName isEqualToString:@"sex"]) {
    
        model.sex = self.content;
    }else if ([elementName isEqualToString:@"age"]) {
    
        model.age =  self.content;
        
    } else if ([elementName isEqualToString:@"number"]) {
        model.number = self.content.integerValue;
    }
      
}









@end
