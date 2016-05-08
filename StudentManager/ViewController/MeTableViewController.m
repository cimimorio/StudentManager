//
//  MeTableViewController.m
//  StudentManager
//
//  Created by 余啸 on 16/2/19.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "MeTableViewController.h"
#import "SetTableViewController.h"

@interface MeTableViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *meImageView;

@end

@implementation MeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)awakeFromNib{
    self.title = @"我";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0&&indexPath.row == 0) {
        SetTableViewController *setVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SetTableViewController"];
        [self showViewController:setVC sender:nil];
    }
}

@end
