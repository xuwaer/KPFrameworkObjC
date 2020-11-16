//
//  NSDate+KPCalender.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KPExtensions)

/**
 时间
 */
@property (assign, nonatomic, readonly) NSInteger kp_era;
@property (assign, nonatomic, readonly) NSInteger kp_year;
@property (assign, nonatomic, readonly) NSInteger kp_month;
@property (assign, nonatomic, readonly) NSInteger kp_day;
@property (assign, nonatomic, readonly) NSInteger kp_hour;
@property (assign, nonatomic, readonly) NSInteger kp_minute;
@property (assign, nonatomic, readonly) NSInteger kp_second;
@property (assign, nonatomic, readonly) NSInteger kp_weekday;
@property (assign, nonatomic, readonly) NSInteger kp_weekdayOrdinal;
@property (assign, nonatomic, readonly) NSInteger kp_quarter;
@property (assign, nonatomic, readonly) NSInteger kp_weekOfMonth;
@property (assign, nonatomic, readonly) NSInteger kp_weekOfYear;
@property (assign, nonatomic, readonly) NSInteger kp_yearForWeekOfYear;
@property (assign, nonatomic, readonly) NSInteger kp_nanosecond;

/**
 可自行从以下类型中选择使用
 NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour
 | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal
 | NSCalendarUnitQuarter | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear
 | NSCalendarUnitNanosecond
 */
@property (strong, nonatomic, readonly) NSDateComponents *kp_components;

/**
 时间戳
 */
@property (assign, nonatomic, readonly) double kp_timeStamp10Since1970;
@property (assign, nonatomic, readonly) double kp_timeStamp13Since1970;

/**
 显示.根据手机设置的地区,使用对应的语言
 NSDateFormatterNoStyle
 NSDateFormatterShortStyle  //“11/23/37” or “3:30pm”
 NSDateFormatterMediumStyle //\"Nov 23, 1937\"
 NSDateFormatterLongStyle   //\"November 23, 1937” or “3:30:32pm\"
 NSDateFormatterFullStyle   //“Tuesday, April 12, 1952 AD” or “3:30:42pm PST”
 */
- (NSString *)kp_dateFormatWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
- (NSString *)kp_dateFormat:(NSString *)format;

@property (assign, nonatomic, readonly) NSString *kp_dateMedium; // 1997-07-01
@property (assign, nonatomic, readonly) NSString *kp_dateLong; // 1997-07-01 00:00:00
@property (assign, nonatomic, readonly) NSString *kp_time24hrs; // 00:00:00
@property (assign, nonatomic, readonly) NSString *kp_time12hrs; // 00:00:00 AM

/*
 时间计算
 */
+ (NSDate *)kp_now;
// 正数为after,负数为before
- (NSDate *)kp_afterOrBefore:(NSDateComponents *)components;
// 比较指定项的差值, 可以指定多个
- (NSDateComponents *)kp_lapse:(NSCalendarUnit)calendarUnit fromDate:(NSDate *)date;
- (NSDateComponents *)kp_lapse:(NSCalendarUnit)calendarUnit toDate:(NSDate *)date;

@end
