//
//  CMEvaluateModel.m
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/25.
//  Copyright © 2018年 HeQin. All rights reserved.
//

#import "CMEvaluateModel.h"

@implementation CMEvaluateModel

- (NSString *)isEmpty:(NSString*)text{
    if ([text isEqual:[NSNull null]]
        ||[text isKindOfClass:[NSNull class]]
        ||text == nil
        ||[text isEqualToString:@"<null>"]){return @"";}
    return [NSString stringWithFormat:@"%@",text];
}

- (NSString *)name {
    return [self isEmpty:_name];
}
- (NSString *)star {
    return [self isEmpty:_star];
}
- (NSString *)content {
    if ([[self isEmpty:_content] isEqualToString:@""]) {
        return @"此用户未填写评论内容";
    }
    return [self isEmpty:_content];
}
- (NSString *)head {
    return [self isEmpty:_head];
}
- (NSString *)time {
    return [self isEmpty:_time];
}
- (NSString *)getNameDesc {
    if (self.name.length >7) {
        NSString *phon = [self.name substringFromIndex:7];
        return [NSString stringWithFormat:@"尾号%@",phon];
    }
    return @"";
}
- (NSString *)getStarDesc {
    return [NSString stringWithFormat:@"给了%@星好评",self.star];
}
@end
