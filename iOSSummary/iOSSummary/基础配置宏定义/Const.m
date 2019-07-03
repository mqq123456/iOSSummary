//
//  Const.m
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/20.
//  Copyright © 2018年 HeQin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// 主页顶部底部距离
int const MainNaviHeight = 0;// 70
// 通知
NSString * const StartPoiNotificationName = @"StartPoiNotificationName";
// Method
#import "Const.h"
@implementation Const
/**
 @return YES 是 异形屏幕
 */
+ (BOOL)isProfiledScreen {
    BOOL iPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {//判断是否是手机
        return iPhoneX;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneX = YES;
        }
    }
    return iPhoneX;
}
+ (int)getStartYWithProfiledScreen {
    if ([self isProfiledScreen]) {
        return 24;
    }else{
        return 0;
    }
}
@end


