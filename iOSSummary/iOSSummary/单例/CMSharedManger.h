//
//  CMSharedManger.h
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/22.
//  Copyright © 2018年 HeQin. All rights reserved.
//  单例存储,用于发布

#import <Foundation/Foundation.h>

@interface CMSharedManger : NSObject

+(CMSharedManger *)shared; // 单例初始化
@property (nonatomic,assign) BOOL parms; // 全局参数
- (NSString *)method; // 全局方法
@end
