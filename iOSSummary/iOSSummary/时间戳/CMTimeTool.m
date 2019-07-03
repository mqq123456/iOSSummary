//
//  TimeTool.m
//  TimePicker
//
//  Created by App on 1/14/16.
//  Copyright © 2016 App. All rights reserved.
//

#import "CMTimeTool.h"
#define MAXCOUNTDAYS 100

@implementation CMTimeTool
//传入今天的时间，返回明天的时间
+ (NSDate *)GetTheDayAfterTomorrow {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [components setDay:([components day]+2)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    return beginningOfWeek;
}

+(NSArray *)daysFromNowToDeadLine{
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyyMMdd"];
    NSDate *startDate = [f dateFromString:[self summaryTimeUsingDate:[NSDate date]]];
    NSDate *endDate = [self GetTheDayAfterTomorrow];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:NSCalendarWrapComponents];
    int diffDays = components.day;
    if(diffDays==0) return @[[self summaryTimeUsingDate:[NSDate date]]];
    NSMutableArray *dayArray = [NSMutableArray array];
    if(diffDays > MAXCOUNTDAYS) diffDays = MAXCOUNTDAYS;
    for (int i = 0; i <= diffDays; i++) {
        NSTimeInterval  iDay = 24*60*60*i;  //1天的长度
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:iDay];
        [dayArray addObject:[self summaryTimeUsingDate:date]];
    }
    return dayArray;
}

+(int)currentDateHour{
    NSLog(@"hour is: %d", [self dateComponents].hour);
    return [self dateComponents].hour;
}

+(int)currentDateMinute{
    NSLog(@"minute is: %d", [self dateComponents].minute);
    return [self dateComponents].minute;
}

+(NSDateComponents *)dateComponents{
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:currentDate];
    return dateComponent;
}

+(NSString *)summaryTimeUsingDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+(NSString *)summaryTimeUsingDate1:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+(NSString *)displayedSummaryTimeUsingString:(NSString *)string
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:[string substringWithRange:NSMakeRange(0, 4)]];
    [result appendString:@"-"];
    [result appendString:[string substringWithRange:NSMakeRange(4, 2)]];
    [result appendString:@"-"];
    [result appendString:[string substringWithRange:NSMakeRange(6, 2)]];
    return result;
}
+ (NSString *)getNowTimeTimestamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970] *1000;
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return timeString;
}
+ (NSString *)getNowTimeFormattString{
    NSDate *zonedate=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:zonedate];
}
+ (NSString *)formattTime:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}
+(BOOL)overdueWithStampString:(NSString *)dateString {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSInteger a=[dat timeIntervalSince1970] *1000;
    NSInteger b = [dateString integerValue];
    if (a > b) {
       return YES;
    }
    return NO;
}
//传入时间返回星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate
{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"(周日)", @"(周一)", @"(周二)", @"(周三)", @"(周四)", @"(周五)", @"(周六)", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}
+(NSString *)getWeak:(NSString *)dateString {
    //日历
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"YYYYMMdd"];
    NSDate *newsDate = [formatter dateFromString:dateString];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"(周日)", @"(周一)", @"(周二)", @"(周三)", @"(周四)", @"(周五)", @"(周六)", nil];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:newsDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}
+(NSString *)getWeakWithDate:(NSDate *)date {
    //日历，真的是醉了，这个时区判断就是不行
    date = [[NSDate alloc] initWithTimeInterval:- 60 *60 *8 sinceDate:date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"(周日)", @"(周一)", @"(周二)", @"(周三)", @"(周四)", @"(周五)", @"(周六)", nil];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    return [weekdays objectAtIndex:theComponents.weekday];
}
// 今明后天显示
+ (NSString *)formateWithStampString:(NSString *)stampString
{
    NSDate *newsDate = [NSDate dateWithTimeIntervalSince1970:[stampString integerValue] / 1000];
    NSString *dateContent;
    NSTimeInterval secondsPerDay =24 * 60 *60;
    NSDate *today=[[NSDate alloc] init];
    NSDate *yearsterDay =  [[NSDate alloc] initWithTimeIntervalSinceNow:secondsPerDay];
    NSDate *qianToday =  [[NSDate alloc] initWithTimeIntervalSinceNow:2*secondsPerDay];
    //假设这是你要比较的date：NSDate *yourDate = ……
    //日历
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    unsigned unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:newsDate];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:yearsterDay];
    NSDateComponents* comp3 = [calendar components:unitFlags fromDate:qianToday];
    NSDateComponents* comp4 = [calendar components:unitFlags fromDate:today];
    if ( comp1.year == comp2.year && comp1.month == comp2.month && comp1.day == comp2.day) {
        dateContent = @"明天";
    }
    else if (comp1.year == comp3.year && comp1.month == comp3.month && comp1.day == comp3.day)
    {
        dateContent = @"后天";
    }
    else if (comp1.year == comp4.year && comp1.month == comp4.month && comp1.day == comp4.day)
    {
        dateContent = @"今天";
    }
    else
    {//返回日期 说明该日期不是今天、明天、后天
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"YYYY-MM-dd"];
        dateContent = [formatter stringFromDate:newsDate];
    }
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"(周日)", @"(周一)", @"(周二)", @"(周三)", @"(周四)", @"(周五)", @"(周六)", nil];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:newsDate];
    NSString *weak = [weekdays objectAtIndex:theComponents.weekday];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@" HH:mm"];
    NSString *time = [formatter stringFromDate:newsDate];
    return [NSString stringWithFormat:@"%@%@%@",dateContent,weak,time];
}
@end
