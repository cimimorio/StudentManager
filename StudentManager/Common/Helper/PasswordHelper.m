//
//  PasswordHelper.m
//  StudentManager
//
//  Created by 余啸 on 16/2/19.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "PasswordHelper.h"
#import "AFNetworking.h"
#import "UserModel.h"
@implementation PasswordHelper

+(void)checkNum:(NSString *)num andPassWord:(NSString *)password :(Block)block{
//    BOOL isRight = NO;
    
    NSDictionary *dic = @{@"num":num,@"password":password};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//    NSString *code;
    NSString *path = @"http://192.168.1.103:8080/Test/MyServlet";
    [manager POST:path parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSLog(@"%@",responseObject);
//            NSLog(@"++%@++",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
            NSDictionary *resDic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
            block(resDic);
    
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setBool:NO forKey:@"isFirstTime"];
        [user synchronize];
    }];
    
}
@end
