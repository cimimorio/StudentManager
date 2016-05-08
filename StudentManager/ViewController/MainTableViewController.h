//
//  MainTableViewController.h
//  StudentManager
//
//  Created by 余啸 on 16/2/19.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface MainTableViewController : UITableViewController
@property (nonatomic, strong) UserModel *model;
@end
