//
//  CMEvalluateCell.h
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/25.
//  Copyright © 2018年 HeQin. All rights reserved.
//  我的评价的cell

#import <UIKit/UIKit.h>
@class CMEvalluateFrame;
@interface CMEvalluateCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) CMEvalluateFrame *statusFrame;
@end
