//
//  ViewController.m
//  UI27_多线程
//
//  Created by dllo on 16/1/19.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, assign) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - 功能代码块
- (IBAction)handleAction:(UIButton *)sender {
    //查看当前代码所在的线程
    
    NSLog(@"fun:%@,funisMain:%d",[NSThread currentThread],[NSThread isMainThread]);
    
    NSInteger sum = 0;
    for (NSInteger i = 0; i < 1000000000; i++) {
        sum += i;
    }
    
    NSLog(@"%ld",sum);
    
}

#pragma mark - 知识点1 通过NSObject开辟子线程
- (IBAction)handleObject:(id)sender {
    NSLog(@"obj:%@",[NSThread currentThread]);
    [self performSelectorInBackground:@selector(handleAction:) withObject:nil];
}
#pragma mark - 知识点2 通过NSThread类开辟子线程
- (IBAction)handleThread:(id)sender {
    //创建线程对象
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(handleAction:) object:nil];
    thread1.name = @"sum";
    //手动开启
    [thread1 start];
    //创建线程对象自动开启
    [NSThread detachNewThreadSelector:@selector(handleAction:) toTarget:self withObject:nil];
    
}

#pragma mark - 知识点3 通过NSOperationQueue 开辟子线程
/** Queue队列中是NSOperation对象。
  * NSOperation对象就是一个任务（一段功能代码）
  * 本身和县城没有关系（不能开子线程）
  * NSOperation是抽象类，需要使用他的子类创建对象
  */
- (IBAction)handleOperationQueue:(id)sender {
    //创建Operation对象
    NSInvocationOperation *invocation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(handleAction:) object:nil];
    
    NSInvocationOperation *invocation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(handleAction:) object:nil];
    
    __weak typeof(self)weakSelf = self;
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf handleAction:nil];
    }];
   
    //创建OperaationQueue对象
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //队列最大并发数
    queue.maxConcurrentOperationCount = 2;
    [queue addOperation:invocation];
    [queue addOperation:blockOperation];
    [queue addOperation:invocation2];
}

#pragma mark - 知识点4：GCD开启子线程
/**
   *GCD核心 队列和任务
   *队列：串行队列和并行队列
   *任务：block块 和 函数 
   *程序本身有一个串行队列（主线程）
   * 有四个并行队列 （优先级区别）
   *
   * 自定义串行队列
   * 自定义并行队列
 */

#pragma mark 88 GCD函数
void functionGCD (void *context) {
    printf("%s\n",context);


}

- (IBAction)handleGCD:(id)sender {
   //获取主线程（获取自带的串行队列）
#if 0
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    __weak typeof (self)weakSelf = self;
    //向队列中异步分布任务
    dispatch_async(queue, ^{
        [weakSelf handleAction:nil];
    });

    __weak typeof (self)weakSelf = self;
    //获取系统的并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [weakSelf handleAction:nil];
    });
    
    dispatch_async(queue, ^{
        [weakSelf handleAction:nil];
    });
    
    //任务是函数
    dispatch_async_f(queue, "dddddd", functionGCD);
#endif
}
#pragma mark **GCD 异步实现加载图片
- (IBAction)handleImage:(id)sender {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *data = [session dataTaskWithURL:[NSURL URLWithString:@"http://www.qqpk.cn/Article/UploadFiles/201111/2011112212074796.jpg"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       //到主线程中添加任务
       dispatch_async(dispatch_get_main_queue(), ^{
           self.imgView.image = [UIImage imageWithData:data];
       });
    }];
    [data resume];
    
}
#pragma mark ** GCD实现单例
+ (instancetype)shareViewController {

    static ViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[ViewController alloc] init];
    });
    return vc;

}

#pragma mark ** 自定义串行队列
- (IBAction)handleCustomSerial:(id)sender {
    
    dispatch_queue_t queue = dispatch_queue_create("com.lanou3g", DISPATCH_QUEUE_SERIAL);
    __weak typeof (self)weakSelf =self;
    dispatch_async(queue, ^{
        [weakSelf handleAction:nil];
    });
}

#pragma mark ** 自定义并行队列
- (IBAction)handleCustomConcurrent:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    __weak typeof (self)weakSelf =self;
    dispatch_async(queue, ^{
        [weakSelf handleAction:nil];
    });
    dispatch_async(queue, ^{
        [weakSelf handleAction:nil];
    });
    
    
}
#pragma mark - 进程互斥
- (IBAction)handleError:(id)sender {
    _count =100;
    //创建进程所
    NSLock *lock = [[NSLock alloc] init];
    dispatch_queue_t ticketQueue = dispatch_queue_create("seeticket", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_async(ticketQueue, ^{
            [lock lock];
            for (int i = 0; i < 10 ; i ++) {
                NSLog(@"买到了第%ld张票",_count);
                _count--;
            }
            [lock unlock];
        });
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
