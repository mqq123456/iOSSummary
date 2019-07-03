//
//  Const.h
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/20.
//  Copyright © 2018年 HeQin. All rights reserved.
//

#import <Foundation/Foundation.h>
// SDK Key

#define AppVersion @"V1.0"
// 屏幕宽高
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
// 颜色
#define NaviColor [UIColor colorWithRed:43.0/255.0 green:52.0/255.0 blue:68.0/255.0 alpha:1]

// 主页顶部底部高度
extern int const MainNaviHeight;
// 通知
extern NSString * const StartPoiNotificationName;
// 导航栏
#import "CMTitleView.h"
// Method
@interface Const : NSObject
/**
 @return YES 是 异形屏幕
 */
+ (BOOL)isProfiledScreen;

+ (int)getStartYWithProfiledScreen;
@end
