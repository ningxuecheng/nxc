//
//  ViewController.m
//  UI17_XML_JSON
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "PasserSAX.h"
#import "ModelForStudent.h"
#import "ParserDOM.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 知识点1： XML SAX 解析
- (IBAction)handleSAX:(id)sender {
    PasserSAX *parser = [[PasserSAX alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"xml"];
  NSArray *arr = [parser passerSAXWithFile:path];
    
   
    for (ModelForStudent *stu in arr) {
        NSLog(@"%@",stu.name);
    }
    
    NSLog(@"%ld",arr.count);
    
}
#pragma mark - 知识点2： XML DOM 解析
- (IBAction)handleDOM:(id)sender {
    ParserDOM *domPar = [[ParserDOM alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"xml"];
    
  NSArray *arr = [domPar parserDOMWithFile:path];
    
    for (ModelForStudent *stu in arr) {
        NSLog(@"%@",stu.name);
    }
    
    NSLog(@"%ld",arr.count);
    
}
#pragma mark - 知识点3： JSON解析
- (IBAction)handleJSON:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"activitylist" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"%@",result);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
