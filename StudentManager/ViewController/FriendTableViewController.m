//
//  SubTableViewController.m
//  XMPPDemo
//
//  Created by cimimorio on 16/4/9.
//  Copyright © 2016年 yuxiao. All rights reserved.
//

#import "FriendTableViewController.h"
#import <ZHXMPP.h>
//#import "AddFriendViewController.h"
//#import "TalkViewController.h"
#import "ChatViewController.h"
#import "ChatCollectionViewController.h"
#import <AFNetworkReachabilityManager.h>
//#import "YXXMPPManager.h"
@interface FriendTableViewController ()<ZHXMPPDelegate>
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) ZHXMPP *manager;
@end

@implementation FriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self login];
    [self congifUI];
//    self.manager = [ZHXMPP xmpp];
//    self.manager.delegate = self;
//    [self loadData];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

#pragma mark -
#pragma mark 初始化UI

-(NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

-(void)congifUI{
    
    self.title = @"连接中...";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(addFriend:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
#pragma mark -
#pragma mark 加载数据



-(void)loadData{
    [self.manager getFrinedList];
}

#pragma mark -
#pragma mark 事件

-(void)login{
    self.manager = [ZHXMPP xmpp];
    [self.manager steup];
    self.manager.delegate = self;
    self.manager.xmppHost = @"192.168.1.103";
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userName = [user stringForKey:@"num"];
    NSString *passWord = [user stringForKey:@"password"];
    __block __typeof (*&self)blockSelf = self;
    [self.manager loginUserName:@"yuxiao" passWord:@"123456" complete:^(BOOL isSuccess, DDXMLElement *error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                blockSelf.title = @"未连接";
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                blockSelf.title = @"室友";
            });
            [blockSelf loadData];
        }
    }];
    dispatch_queue_t globle_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globle_queue, ^{
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                {
                    
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                {
                    
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                {
                    
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                {
                    
                }
                    break;
                default:
                    break;
            }
        }];
    });
    
    
}

-(void)addFriend:(UIButton *)btn{
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    AddFriendViewController *addVC = [sb instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
//    addVC.delegate = self;
//    [self presentViewController:addVC animated:YES completion:nil];
//    
    
}

#pragma mark -
#pragma mark 数据请求



#pragma mark -
#pragma mark 代理

-(void)loginSuccess:(BOOL)isSuccess andError:(NSXMLElement *)error;
{
    NSLog(@"登陆成功");
}
//改变用户状态
-(void)changeUserStatue:(BOOL)isSuccess and:(int)statue{
    NSLog(@"用户状态是%d",statue);
}
//注册成功
-(void)regiserSuccess:(BOOL)isSucess andError:(NSXMLElement *)error{
    
}
//
-(void)didReciveVCardInfo:(XMPPvCardTemp *)vCardTemp{
    
}
//当好友或者自己状态改变
-(void)didReciveUserStatueChanged:(XMPPJID *)jid{
    NSLog(@"用户状态改变");
}
//当收到其他人加好友
-(void)didReciveAddFriendRequest:(XMPPJID *)jid{
    NSLog(@"收到好友要请");
}
//收到消息
-(void)didReciveMessage:(XMPPJID *)jid andXMPPMessage:(XMPPMessage *)message{
    NSLog(@"收到消息来自%@",jid.user);
}
//推出登陆
-(void)didLogout:(BOOL)isSuccess andError:(NSError *)error{
    
    NSLog(@"推出登陆");
    
}
//已经收到删除好友的请求
-(void)didReciveDeleteRequest:(XMPPJID *)jid{
    NSLog(@"你被%@删除",jid.user);
}

-(void)didReciveFriendList:(NSArray<XMPPJID *> *)friendList{
    if (self.dataList) {
        [self.dataList removeAllObjects];
    }else{
        self.dataList = [NSMutableArray new];
    }
    for (XMPPJID *jid in friendList) {
        [self.dataList addObject:jid];
        
    }
    [self.tableView reloadData];
}

-(void)reloadFirendList{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self loadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return _dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    XMPPJID *jid = self.dataList[indexPath.row];
    cell.textLabel.text = jid.user;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    TalkViewController *talkVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TalkViewController"];
    XMPPJID *jid = _dataList[indexPath.row];
//    talkVC.jid = jid;
    
    ChatCollectionViewController *chatVC = [[ChatCollectionViewController alloc] init];
    chatVC.jid = jid;
    NSLog(@"%@",jid.user);
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁
#pragma mark - Table view data source


@end
