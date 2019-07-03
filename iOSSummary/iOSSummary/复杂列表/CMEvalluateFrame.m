//
//  CMEvalluateFrame.m
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/25.
//  Copyright © 2018年 HeQin. All rights reserved.
//

#import "CMEvalluateFrame.h"
#import "CMEvaluateModel.h"
#import "Const.h"
@implementation CMEvalluateFrame
- (void)setModel:(CMEvaluateModel *)model {
    _model = model;
    self.headImgF =CGRectMake(20, 10, 50, 50);
    CGRect  nameRect = [[model getNameDesc] boundingRectWithSize:CGSizeMake(200, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:nameFont} context:nil];
    self.nameLabF = CGRectMake(CGRectGetMaxX(self.headImgF) + 5, 10, nameRect.size.width, 30);
    self.starLabF = CGRectMake(CGRectGetMaxX(self.nameLabF) + 10, 10, 200, 30);
    CGRect  contentRect = [model.content boundingRectWithSize:CGSizeMake(SCREENWIDTH - CGRectGetMaxX(self.headImgF) - 20, 300) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];
    self.descLabF = CGRectMake(CGRectGetMaxX(self.headImgF)  +5, CGRectGetMaxY(self.nameLabF), SCREENWIDTH - CGRectGetMaxX(self.headImgF) - 20, contentRect.size.height);
    self.timeLabF = CGRectMake(CGRectGetMaxX(self.headImgF)  +5, CGRectGetMaxY(self.descLabF) +5 , 300, 30);
    self.lineViewF = CGRectMake(0, CGRectGetMaxY(self.timeLabF) +5, SCREENWIDTH, 10);
    self.cellHeight = CGRectGetMaxY(self.lineViewF);
}
@end
