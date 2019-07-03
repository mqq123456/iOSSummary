//
//  CMSharedManger.m
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/22.
//  Copyright © 2018年 HeQin. All rights reserved.
//  单例存储数据

#import "CMSharedManger.h"

@implementation CMSharedManger
static CMSharedManger *_onetimeClass;
+(CMSharedManger *)shared
{
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        _onetimeClass = [[CMSharedManger alloc] init];
    });
    
    return _onetimeClass;
}
- (NSString *)method {
    return @"";
}
@end
