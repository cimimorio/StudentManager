//
//  RoomInfo.h
//  StudentManager
//
//  Created by cimimorio on 16/4/8.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RoomInfo : JSONModel

@property (nonatomic, copy) NSString *num;
@property (nonatomic, copy) NSString *rest;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
