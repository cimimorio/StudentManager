//
//  PayHelper.m
//  StudentManager
//
//  Created by cimimorio on 16/5/8.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "PayHelper.h"

@implementation PayHelper

-(instancetype)share{
    static PayHelper *payhelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        payhelper = [[PayHelper alloc] init];
    });
    return payhelper;
}




@end
