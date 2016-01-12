//
//  ParserSAX.m
//  UI16_homework_json_xml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserSAX.h"
#import "Cartoon.h"
@interface ParserSAX ()<NSXMLParserDelegate>

@property (nonatomic, retain) NSMutableArray *arr;

//中间值
@property (nonatomic, retain) NSString *string;
@property (nonatomic, retain) NSMutableString *tmp;

@property (nonatomic, assign) NSInteger num;
@end

@implementation ParserSAX




- (NSArray *)parserSAXWithFile:(NSString *)path {

    self.arr = [NSMutableArray array];
    
    //NSXMLParser
    NSXMLParser *xmlPar = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfFile:path]];
    
    //数据通过协议回调回来的
    xmlPar.delegate = self;
    
    //开始解析
    [xmlPar parse];
    
    return self.arr;
}

#pragma mark - xmlParser协议方法

/** 读到开始标签 */

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {

    if ([elementName isEqualToString:@"name"]) {
//        NSLog(@"%@",elementName);
        Cartoon *model = [[Cartoon alloc] init];
        model.desc = [NSMutableString string];
        self.tmp = [NSMutableString string];
        [self.arr addObject:model];
    } else if ([elementName isEqualToString:@"desc"])
    {
    
        self.num = parser.lineNumber;
    }
   
}

/** 读到标签之间的值的时候，*/
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

    self.string = string;
    if (parser.lineNumber == self.num) {
        [self.tmp appendString:string];
    }else {
    
    self.tmp = [NSMutableString string];
    }
    
   
}

/** 读到结束标签时调用 */

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //从数组中指向最后一个对象
    Cartoon *model = [self.arr lastObject];
    
    if ([elementName isEqualToString:@"name"]) {
        model.name = self.string;
       
    } else if ([elementName isEqualToString:@"desc"])
    {
        model.desc = self.tmp.mutableCopy;
    }



}










@end
