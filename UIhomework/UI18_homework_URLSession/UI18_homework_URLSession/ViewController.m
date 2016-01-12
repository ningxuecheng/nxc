//
//  ViewController.m
//  UI18_homework_URLSession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate,NSURLSessionDataDelegate,NSURLSessionTaskDelegate>

@property (nonatomic, retain) NSMutableData *data;

@end

@implementation ViewController
- (IBAction)handleGETByBlock:(id)sender {
    //URL
    
    NSURL *url = [NSURL URLWithString:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
    
    // 创建Session对象（通道）
    NSURLSession *session = [NSURLSession sharedSession];
    
    //创建任务（task）
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //block中的参数，就是从服务器获取数据
        //NSLog(@"response:%@",response);
        
        //解析
        NSError *err = nil;
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        NSLog(@"%@",result);
        
    }];
    
    
    //开始任务
    [task resume];
}

- (IBAction)handleGETByDelegate:(id)sender {
    self.data = [NSMutableData data];
    
    //URL
    NSURL *url = [NSURL URLWithString:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
    //session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //添加任务
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    
    //开始任务
    [task resume];
    
    
    
}

#pragma mark - delegate回调方法
/** 当从服务器收到响应的时候，调用此方法*/
- (void)URLSession:(NSURLSession * )session dataTask:(NSURLSessionDataTask * )dataTask didReceiveResponse:(NSURLResponse * )response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {

    NSLog(@"%@",response);
    completionHandler(NSURLErrorDataNotAllowed); //继续向下执行

}

/** 当接受导数据的时候，调用此方法 此方法可能调用多次*/
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {

//将数据进行拼接
    [self.data appendData:data];

}






- (IBAction)handlePOSTByDelegate:(id)sender {
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
