//
//  CMEvaluateModel.h
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/25.
//  Copyright © 2018年 HeQin. All rights reserved.
//  评价模型

#import <Foundation/Foundation.h>

@interface CMEvaluateModel : NSObject
@property (nonatomic , copy) NSString *name;
@property (nonatomic , copy) NSString *star;
@property (nonatomic , copy) NSString *content;
@property (nonatomic , copy) NSString *time;
@property (nonatomic , copy) NSString *head;
- (NSString *)getNameDesc;
- (NSString *)getStarDesc;
@end
