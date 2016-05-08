//
//  MainTableViewController.m
//  StudentManager
//
//  Created by 余啸 on 16/2/19.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainService.h"
#import "PasswordHelper.h"
#import "UserModel.h"
#import "RoomInfo.h"
@interface MainTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *electricBillLabel;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
//    NSLog(@"%@",self.model);
//    self.electricBillLabel.text = [NSString stringWithFormat:@"%@%@",self.model.roomNum,self.model.name];
    [self loadData];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}
#pragma mark -
#pragma mark 初始化UI

#pragma mark -
#pragma mark 加载数据

-(void)loadData{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *num = [user objectForKey:@"num"];
    NSString *password = [user objectForKey:@"password"];
    NSLog(@"%@   %@",num,password);
    [PasswordHelper checkNum:num andPassWord:password :^(id data) {
        UserModel *model = [[UserModel alloc] initWithDictionary:data[@"data"] error:nil];
        NSLog(@"%@",model);
        [[MainService new] getDataByRoomNum:model.roomNum :^(id data) {
            RoomInfo *infoModel = [[RoomInfo alloc] initWithDic:data[@"data"]];
            
            self.electricBillLabel.text = [NSString stringWithFormat:@"%@寝室剩余电费：%@",infoModel.num,infoModel.rest];
        }];
    }];
}

#pragma mark -
#pragma mark 事件

#pragma mark -
#pragma mark 数据请求

#pragma mark -
#pragma mark 代理

#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

-(void)awakeFromNib{
    self.title = @"寝室信息";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



@end
