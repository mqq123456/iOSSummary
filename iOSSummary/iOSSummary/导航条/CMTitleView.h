//
//  TitleView.h
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/21.
//  Copyright © 2018年 HeQin. All rights reserved.
//  顶部标题栏

#import <UIKit/UIKit.h>

@interface CMTitleView : UIView
// 设置标题，并添加返回按钮回调
- (void)setTitle:(NSString *)title backBlock:(void (^)(void))backBlock;
// 设置标题和右侧按钮名称，并添加回调
- (void)setTitle:(NSString *)title rightBtn:(NSString *)right backBlock:(void (^)(void))backBlock  rightBlock:(void (^)(void))rightBlock;
- (void)hideRightBtn:(BOOL)isHide;
@end
