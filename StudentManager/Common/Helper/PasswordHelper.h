//
//  PasswordHelper.h
//  StudentManager
//
//  Created by 余啸 on 16/2/19.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
typedef void(^Block)(id data);

@interface PasswordHelper : NSObject
+(void)checkNum:(NSString *)num andPassWord:(NSString *)password :(Block)block;
@end
