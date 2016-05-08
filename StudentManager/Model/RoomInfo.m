//
//  RoomInfo.m
//  StudentManager
//
//  Created by cimimorio on 16/4/8.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "RoomInfo.h"

@implementation RoomInfo

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        _num = dic[@"num"];
        _rest = dic[@"rest"];
    }
    return self;
}

@end
