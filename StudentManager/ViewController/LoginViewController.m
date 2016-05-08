//
//  LoginViewController.m
//  StudentManager
//
//  Created by 余啸 on 16/2/18.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "PasswordHelper.h"
#import "WZFlashButton.h"
#import "KVNProgress.h"
#import "UserModel.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loginImageView;
@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic,strong) WZFlashButton *button;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
}
/**
 涟漪效果按钮：
 WZFlashButton *outerRoundFlashButton = [[WZFlashButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
 outerRoundFlashButton.buttonType = WZFlashButtonTypeOuter;
 outerRoundFlashButton.layer.cornerRadius = 25;
 outerRoundFlashButton.flashColor = [UIColor colorWithRed:240/255.f green:159/255.f blue:10/255.f alpha:1];
 outerRoundFlashButton.backgroundColor = [UIColor colorWithRed:0 green:152.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
 [self.view addSubview:outerRoundFlashButton];
 */
-(void)configUI{
    
    self.button = [[WZFlashButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, 300, 100, 40)];
    self.button.buttonType = WZFlashButtonTypeOuter;
    self.button.flashColor = [UIColor blueColor];
    [self.button setText:@"登陆" withTextColor:[UIColor blueColor]];
    self.button.layer.cornerRadius = 20;
    self.button.backgroundColor = [UIColor whiteColor];
    
    __block __typeof(*&self) blockSelf = self;
    self.button.clickBlock = ^(void){
        [blockSelf btnClicked];
    };
    [self.view addSubview:self.button];
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.passwordTextField endEditing:YES];
    [self.numTextField endEditing:YES];
//    NSLog(@"000");
}
/*
 -[KVNProgress showErrorWithParameters:@{KVNProgressViewParameterStatus: @"Error",
 KVNProgressViewParameterFullScreen: @(YES)}];
 */
-(void)btnClicked{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [PasswordHelper checkNum:self.numTextField.text andPassWord:self.passwordTextField.text :^(id data) {
        NSDictionary *tempDic = data;
        if ([tempDic[@"code"] isEqualToString:@"1002"]) {
            NSDictionary *tempDic = data[@"data"];
            UserModel * resModel = [[UserModel alloc] initWithDictionary:tempDic error:nil];
            [self saveData:resModel.num andPassword:resModel.passWord];
            HomeViewController *homeVC = [sb instantiateViewControllerWithIdentifier:@"HomeViewController"];
            [self presentViewController:homeVC animated:YES completion:nil];
        }else{
            [KVNProgress showErrorWithParameters:@{KVNProgressViewParameterStatus:@"学号或密码错误",KVNProgressViewParameterFullScreen:@(NO)}];
        }
    }];
    
}

-(void)saveData:(NSString *)num andPassword:(NSString *)password{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:num forKey:@"num"];
    [user setObject:password forKey:@"password"];
    [user synchronize];
}

-(void)awakeFromNib{
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source





@end
