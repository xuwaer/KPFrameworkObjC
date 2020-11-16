//
//  NSNumber+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (KPExtensions)

// ++
- (NSNumber *)kp_increment;
// --
- (NSNumber *)kp_decrement;

/**
 根据时间戳转换为NSDate.
 */
- (NSDate *)kp_dateFromTimeStamp10;
- (NSDate *)kp_dateFromTimeStamp13;
    
    
/**
 xx:xx:xx格式
 */
- (NSString *)kp_secondDurationWithoutHour;
- (NSString *)kp_secondDuration;
@end
