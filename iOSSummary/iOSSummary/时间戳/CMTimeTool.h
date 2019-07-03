//
//  TimeTool.h
//  TimePicker
//
//  Created by App on 1/14/16.
//  Copyright © 2016 App. All rights reserved.
//  时间处理

#import <Foundation/Foundation.h>

@interface CMTimeTool : NSObject

+(NSArray *)daysFromNowToDeadLine;

+(int)currentDateHour;

+(int)currentDateMinute;

+(NSString *)displayedSummaryTimeUsingString:(NSString *)string;
// 获取现在时间戳
+ (NSString *)getNowTimeTimestamp;
// 获取现在格式化的时间
+ (NSString *)getNowTimeFormattString;
// 格式化时间
+ (NSString *)formattTime:(NSDate *)date;
+(NSString *)getWeak:(NSString *)dateString;
+ (NSString *)formateWithStampString:(NSString *)stampString;
+(NSString *)getWeakWithDate:(NSDate *)date;
// 是否过期
+(BOOL)overdueWithStampString:(NSString *)dateString;
@end
