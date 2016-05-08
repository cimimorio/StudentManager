//
//  HomeViewController.m
//  StudentManager
//
//  Created by 余啸 on 16/2/18.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "HomeViewController.h"
#import "MainTableViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    for (UITabBarItem *item in self.tabBar.items) {
        item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:26/255.0 green:170/255.0 blue:10/255.0 alpha:1.0]} forState:UIControlStateSelected];
    }
    
    
    
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
