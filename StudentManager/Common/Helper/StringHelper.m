//
//  StringHelper.m
//  StudentManager
//
//  Created by cimimorio on 16/4/9.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper
+(NSString *)checkString:(NSString *)str{
    int index = 0;
    for (int i = 0; i < [str length]; i++) {
//        NSLog(@"%c",[str characterAtIndex:i]);
        if ([str characterAtIndex:i] == '{') {
            index = i;
            break;
        }
    }
    NSString *string = [str substringFromIndex:index];
    return string;
}
@end
