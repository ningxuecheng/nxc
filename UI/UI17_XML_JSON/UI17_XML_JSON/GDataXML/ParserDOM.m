//
//  ParserDOM.m
//  UI17_XML_JSON
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserDOM.h"
#import "GDataXMLNode.h"
#import "ModelForStudent.h"
@interface ParserDOM ()
//解析之后存放model的数组
@property (nonatomic, retain) NSMutableArray *arr;

@end


@implementation ParserDOM
- (NSArray *)parserDOMWithFile:(NSString *)filePath {
    self.arr = [NSMutableArray array];
    //GDataXMLDocument对象。
    NSError *error = nil;
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:[NSData dataWithContentsOfFile:filePath] options:1 error:&error];
   //获取根元素
  GDataXMLElement *root = [document rootElement];
    NSLog(@"%@",root);
   //获取所有<student>子元素
    NSArray *arr = [root elementsForName:@"student"];
    for (GDataXMLElement *element in arr) {
        ModelForStudent *model = [[ModelForStudent alloc] init];
        model.name = [[[element elementsForName:@"name"] lastObject] stringValue];
        model.age = [[[element elementsForName:@"age"] lastObject] stringValue];
        model.number = [[[element elementsForName:@"number"] lastObject] stringValue].integerValue;
        model.sex = [[[element elementsForName:@"sex"] lastObject] stringValue];
        [self.arr addObject:model];
    }
    return self.arr;
}
@end
