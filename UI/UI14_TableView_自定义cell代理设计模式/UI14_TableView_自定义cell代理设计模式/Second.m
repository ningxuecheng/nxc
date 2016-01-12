//
//  Second.m
//  UI14_TableView_自定义cell代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Second.h"

@interface Second () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation Second

- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableViewSubView];
}


- (void)tableViewSubView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool2"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
    [_tableView release];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    return cell;

}


- (void)handleData {
self.array = @[@"zhang",@"wang",@"wu",@"li",@"zhou"].mutableCopy;


}

#pragma mark - tableView degelate

/** iOS8 推出的新API，右侧滑动出现**/
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {

/** 创建多个rowActon对象 */
UITableViewRowAction *actonEdit = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
    [self alertControllerWithEdit];
    
}];

UITableViewRowAction *actonDelete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"del" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
    [self alertControllerWith:indexPath];
    
}];
    
    return @[actonDelete,actonEdit];
}


#pragma mark - alertController
/**UIAlertController 详见API */
- (void)alertControllerWith:(NSIndexPath *)indexpath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否删除" preferredStyle:UIAlertControllerStyleAlert];
    /** 添加action*/
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 取出两个textField
        NSArray *arr = alert.textFields;
        
        for (UITextField *field in arr) {
            NSLog(@"%@",field.text);
        }
        
    }];
    
    UIAlertAction *actionDele = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       
        NSLog(@"aaa");
    }];
    
    UIAlertAction *actionDetail = [UIAlertAction actionWithTitle:@"Detail" style:0 handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"zxc");
        [self deleteCell:indexpath];
    }];
    
    
    [alert addAction:actionOK];
    [alert addAction:actionDele];
    [alert addAction:actionDetail];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        //占位符
        textField.placeholder = @"请输入用户名";
        
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
    }];
    
    
    /** 莫泰推出 */
    [self presentViewController:alert animated:YES completion:^{
        
    }];


}



- (void)deleteCell:(NSIndexPath *)index {

// 数据
    
    [self.array removeObjectAtIndex:index.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[index] withRowAnimation:YES];
    
}

- (void)alertControllerWithEdit {
 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否编辑" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:0 handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"DDD");
    
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:1 handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"aaa");
        
    }];

    [alert addAction:actionOK];
    [alert addAction:actionCancel];
    
    /**/
    [self presentViewController:alert animated:YES completion:^{
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
