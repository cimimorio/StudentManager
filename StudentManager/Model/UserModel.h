//
//  UserModel.h
//  StudentManager
//
//  Created by cimimorio on 16/3/26.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserModel : JSONModel
@property (nonatomic, copy) NSString *num;
@property (nonatomic, copy) NSString *passWord;
@property (nonatomic, copy) NSString *roomNum;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@end
