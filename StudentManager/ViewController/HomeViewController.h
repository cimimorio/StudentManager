//
//  HomeViewController.h
//  StudentManager
//
//  Created by 余啸 on 16/2/18.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface HomeViewController : UITabBarController
@property (nonatomic, strong) UserModel *model;
@end
