//
//  CMEvalluateFrame.h
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/25.
//  Copyright © 2018年 HeQin. All rights reserved.
//  评价，cell尺寸模型

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define nameFont [UIFont systemFontOfSize:18]
#define contentFont [UIFont systemFontOfSize:16]

@class CMEvaluateModel;
@interface CMEvalluateFrame : NSObject
@property (nonatomic, strong) CMEvaluateModel *model;
@property (nonatomic, assign) CGRect headImgF;
@property (nonatomic, assign) CGRect nameLabF;
@property (nonatomic, assign) CGRect starLabF;
@property (nonatomic, assign) CGRect descLabF;
@property (nonatomic, assign) CGRect timeLabF;
@property (nonatomic, assign) CGRect lineViewF;
@property (nonatomic, assign) CGFloat cellHeight;
@end
