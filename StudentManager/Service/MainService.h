//
//  MainService.h
//  StudentManager
//
//  Created by cimimorio on 16/4/8.
//  Copyright © 2016年 余啸. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block)(id data);

@interface MainService : NSObject

-(void)getDataByRoomNum:(NSString *)roomNum :(Block)block;

@end
