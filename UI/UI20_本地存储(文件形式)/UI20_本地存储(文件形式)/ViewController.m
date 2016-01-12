//
//  ViewController.m
//  UI20_本地存储(文件形式)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ModelForPerson.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 知识点1 APP包路径
- (IBAction)findAPPPath:(id)sender {
   // NSBundle类
   // 获取APP包路径
  NSString *appPath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"path:%@",appPath);
    // 获取APP包中的某一个资源路径
    NSString *resPath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    NSLog(@"res:%@",resPath);
}
#pragma mark - 知识点2 沙盒路径
- (IBAction)findSandBoxPath:(id)sender {
    
    //API: NSHomeDirectory
  NSString *sandBoxPath = NSHomeDirectory ();
     NSLog(@"sandPath:%@",sandBoxPath);
    
    
}
#pragma mark - 知识点3 利用API快速获取沙盒中个文件夹路径
- (IBAction)findPath:(id)sender {
    
    //API:NSSearchPathForDirectoriesInDomains
    /** @brief 获取沙盒中Document文件夹路径
        @param directory 要查找的目录名（文件夹）
        @param domainMask 在哪个domain中查找参数的目录名
        @param expandTilde 是否展开 ~
        @return NSArray 将查找到的目录路径放到一个数组中返回（因此可能会有多个同名的目录）
     */
  NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"docPath:%@",docPath);
     // 获取Caches(缓存文件夹)路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"cacher:%@",cachesPath);
    // 获取tmp(临时文件夹)路径
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"tmp:%@",tmpPath);
    
    //获取library（资源库）路径
    
    NSString *labPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    NSLog(@"lab:%@",labPath);
    
    //获取Preferences文件夹路径（拼接而成）
    NSString *prePath = [labPath stringByAppendingString:@"/Preferences"];
     NSLog(@"per:%@",prePath);
        //在拼接路径时常用
    NSString *prePath2 = [labPath stringByAppendingPathComponent:@"Preferences"];
    NSLog(@"per:%@",prePath2);
 }
#pragma mark - 知识点4 简单对象读写到本地
#pragma mark ** NSString 对象
- (IBAction)handleNSStringWriteToDisk:(id)sender {
    //要保存的字符串对象
    NSString *str = @"iphone6";
    
    //文件保存路径.
    NSString *dicPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *file = [dicPath stringByAppendingPathComponent:@"name.txt"];
    
    //写入磁盘 disk
    
    [str writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",NSHomeDirectory());
    
}
- (IBAction)handleReadFromdisk:(id)sender {
    //文件所在路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"name.txt"];
    
    //生成NSString对象。
    NSString *readStr = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"read:%@",readStr);
    
}
#pragma mark ** NSArray 对象
- (IBAction)handleNSArray:(id)sender {
    //
    NSArray *array = @[@"zhang",@"sun",@"li"];
    //创建文件保存路景
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"array.plist"];
    //写入
    [array writeToFile:file atomically:YES];
    NSLog(@"%@",NSHomeDirectory());
}
- (IBAction)handleReadNSArray:(id)sender {
    //文件所在路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/array"];
    NSArray *array = [NSArray arrayWithContentsOfFile:file];
     NSLog(@"%@",array);
}
#pragma mark ** NSData 对象
- (IBAction)handleWriteNSData:(id)sender {
    //要存储的NSData
     UIImage *img = [UIImage imageNamed:@"2.jpg"];
  NSData *data = UIImageJPEGRepresentation(img, 1);
     NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"1.jpg"];
    [data writeToFile:file atomically:YES];
    NSLog(@"%@",NSHomeDirectory());
 }
- (IBAction)handleReadNSData:(id)sender {
    //
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"1.da"];
     //
    NSData *data = [NSData dataWithContentsOfFile:file];
    //image对象
    UIImage *img = [UIImage imageWithData:data];
    NSLog(@"%@",img);
     UIImage *img2 = [UIImage imageWithContentsOfFile:file];
    NSLog(@"%@",img2);
}
#pragma mark ** NSDic 对象
- (IBAction)handleWriteDic:(id)sender {
    NSDictionary *dic = @{@"name":@"zhang",
                          @"sex":@"male",
                          @"age":@"17"};
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"dic.plist"];
     [dic writeToFile:file atomically:YES];
}
- (IBAction)handleReadDic:(id)sender {
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"dic.plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:file];
    
    NSLog(@"%@",dic);
    
    
    
    
}
#pragma mark - 知识点5 复杂对象读写
- (IBAction)handleModelWrite:(id)sender {
    //要归档的model对象 (!!! 要归档的model类一定要实现NSCoding两个协议方法)
    ModelForPerson *per = [[ModelForPerson alloc] init];
      per.name = @"zhangsan";
    per.sex = @"male";
     //创建归档时所需的Data对象
      NSMutableData *data = [NSMutableData data];
      //归档类
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
      //开始归档
    [archiver encodeObject:per forKey:@"per"];
     //归档结束
    [archiver finishEncoding];
    //data写入本地
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.da"];
    [data writeToFile:file atomically:YES];
}
- (IBAction)handleModelRead:(id)sender {
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.da"];
    NSData *data = [NSData dataWithContentsOfFile:file];
     //反归档类
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //开始反归档
 ModelForPerson *per = [unarchiver decodeObjectForKey:@"per"];
    //反归档结束
    [unarchiver finishDecoding];
    NSLog(@"%@ %@",per.name,per.sex);
}
#pragma mark - 知识点6 NSFileManager 类
- (IBAction)hanleFileManager:(id)sender {
    //创建对象
    NSFileManager *manage = [NSFileManager defaultManager];
    //创建文件夹
    NSString *dir = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Demo"];
    
    [manage createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    
    //~/IOS/UI
    NSString *dirUI = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"IOS/UI"];
    [manage createDirectoryAtPath:dirUI withIntermediateDirectories:YES attributes:nil error:nil];
    // 创建一个文件(file)
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"task.txt"];
    NSData *data = [@"iphone" dataUsingEncoding:NSUTF8StringEncoding];
    
    [manage createFileAtPath:filePath contents:data attributes:nil];
    
    //查看文件或者是目录的属性
   NSLog(@"%@",[manage attributesOfItemAtPath:filePath error:nil]);
    

    //删除文件夹(目录)
    [manage removeItemAtPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] error:nil];
    
    
#pragma mark 功能未实现
    //cacahes文件夹删除之后，在乡里面添加文件
    [manage createFileAtPath:filePath contents:data attributes:nil];
    
    NSString *string = @"iOS";
    [string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *filePatn2 = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"text.txt"];
    
    [string writeToFile:filePatn2 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //查看一个目录中含有的内容
  NSArray *array = [manage contentsOfDirectoryAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] error:nil];
    NSLog(@"%@",array);
     //查看一个目录中含有的内容
    NSData *dataStr = [manage contentsAtPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"name.txt"]];
     NSString *strNAME = [[NSString alloc] initWithData:dataStr encoding:NSUTF8StringEncoding];
    NSLog(@"%@",strNAME);
}

#pragma mark - 知识点7 NSFile

- (IBAction)fileHandle:(id)sender {
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"name.txt"];
    //创建对象
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    
    //转换成NSData对象。
    [handle availableData].bytes; //获取NSData的内容首地址
    
   NSUInteger *length = [handle availableData].length;
    ///关闭文件
    [handle closeFile];
    //利用NSFilehandle进行字符串拼接
    
    NSFileHandle *handle2 = [NSFileHandle fileHandleForWritingAtPath:filePath];
    
    //指针移到文件的最后
    [handle2 seekToEndOfFile];
    //添加新的内容
    [handle2 writeData:[@"iOS" dataUsingEncoding:NSUTF8StringEncoding]];
    //关闭文件
    [handle2 closeFile];
    
    
    
    
    
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
