//
//  MainService.m
//  StudentManager
//
//  Created by cimimorio on 16/4/8.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import "MainService.h"
#import <AFNetworking/AFNetworking.h>
#import "StringHelper.h"
@implementation MainService

-(void)getDataByRoomNum:(NSString *)roomNum :(Block)block{
    
//    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
//    [securityPolicy setAllowInvalidCertificates:YES];
    dispatch_queue_t globle_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globle_queue, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        //    [manager setSecurityPolicy:securityPolicy];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSLog(@"%@",roomNum);
        NSDictionary *dic = @{@"roomnum":roomNum};
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
        [manager POST:@"http://192.168.1.103:8080/Test/DataServlet" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject) {
                NSError *error;
                NSString *dataStr = [StringHelper checkString:[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]];
                //            NSString *dataStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:[dataStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
                if (error) {
                    NSLog(@"%@",error);
                }
                NSLog(@"--------%@----%@---",dataStr,dic1);
                block(dic1);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    });
    
   
    
}

@end
