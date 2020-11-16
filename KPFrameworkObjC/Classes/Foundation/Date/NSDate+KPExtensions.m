//
//  NSDate+KPCalender.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSDate+KPExtensions.h"

static NSCalendar *kpCalender = nil;

@implementation NSDate (KPExtensions)

/**
 这里使用单例。因为有项目(在频繁创建的时候发生错误)遇到过问题
 */
- (NSCalendar *)kpCalender
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kpCalender = [NSCalendar currentCalendar];
    });
    return kpCalender;
}

- (NSInteger)dateForCalenderUnit:(NSCalendarUnit)unit
{
    return [[self kpCalender] component:unit fromDate:self];
}

/**
 时间
 */
- (NSInteger)kp_era
{
    return [self dateForCalenderUnit:NSCalendarUnitEra];
}

- (NSInteger)kp_year
{
    return [self dateForCalenderUnit:NSCalendarUnitYear];
}

- (NSInteger)kp_month
{
    return [self dateForCalenderUnit:NSCalendarUnitMonth];
}

- (NSInteger)kp_day
{
    return [self dateForCalenderUnit:NSCalendarUnitDay];
}

- (NSInteger)kp_hour
{
    return [self dateForCalenderUnit:NSCalendarUnitHour];
}

- (NSInteger)kp_minute
{
    return [self dateForCalenderUnit:NSCalendarUnitMinute];
}

- (NSInteger)kp_second
{
    return [self dateForCalenderUnit:NSCalendarUnitSecond];
}

- (NSInteger)kp_weekday
{
    return [self dateForCalenderUnit:NSCalendarUnitWeekday];
}

- (NSInteger)kp_weekdayOrdinal
{
    return [self dateForCalenderUnit:NSCalendarUnitWeekdayOrdinal];
}

- (NSInteger)kp_quarter
{
    return [self dateForCalenderUnit:NSCalendarUnitQuarter];
}

- (NSInteger)kp_weekOfMonth
{
    return [self dateForCalenderUnit:NSCalendarUnitWeekOfMonth];
}

- (NSInteger)kp_weekOfYear
{
    return [self dateForCalenderUnit:NSCalendarUnitWeekOfYear];
}

- (NSInteger)kp_yearForWeekOfYear
{
    return [self dateForCalenderUnit:NSCalendarUnitYearForWeekOfYear];
}

- (NSInteger)kp_nanosecond
{
    return [self dateForCalenderUnit:NSCalendarUnitNanosecond];
}

/**
 外部自行选择时间部分
 */
- (NSDateComponents *)kp_components
{
    return [[self kpCalender] components:self.kpCalenderUnits fromDate:self];
}

- (NSCalendarUnit)kpCalenderUnits
{
    return NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour
    | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal
    | NSCalendarUnitQuarter | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear
    | NSCalendarUnitNanosecond;
    
}

/**
 时间戳
 */
- (double)kp_timeStamp10Since1970
{
    return self.timeIntervalSince1970;
}

- (double)kp_timeStamp13Since1970
{
    return self.timeIntervalSince1970 * 1000;
}

/**
 显示
 */
- (NSString *)kp_dateFormatWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    return [NSDateFormatter localizedStringFromDate:self dateStyle:dateStyle timeStyle:timeStyle];
}

- (NSString *)kp_dateFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
//    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)kp_dateMedium
{
    return [self kp_dateFormat:@"yyyy-MM-dd"];
}

- (NSString *)kp_dateLong
{
    return [self kp_dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

// 00:00:00
- (NSString *)kp_time24hrs
{
    return [self kp_dateFormat:@"HH:mm:ss"];
}

// 00:00:00 AM
- (NSString *)kp_time12hrs
{
    return [self kp_dateFormat:@"hh:mm:ss a"];
}

/**
 时间计算
 */
+ (NSDate *)kp_now
{
    return [NSDate date];
}

- (NSDate *)kp_afterOrBefore:(NSDateComponents *)components
{
    return [[self kpCalender] dateByAddingComponents:components toDate:self options:kNilOptions];
}

// 比较指定项的差值
- (NSDateComponents *)kp_lapse:(NSCalendarUnit)calendarUnit fromDate:(NSDate *)date
{
    return [[self kpCalender] components:calendarUnit fromDate:date toDate:self options:kNilOptions];
}

- (NSDateComponents *)kp_lapse:(NSCalendarUnit)calendarUnit toDate:(NSDate *)date
{
    return [[self kpCalender] components:calendarUnit fromDate:self toDate:date options:kNilOptions];
}

@end
