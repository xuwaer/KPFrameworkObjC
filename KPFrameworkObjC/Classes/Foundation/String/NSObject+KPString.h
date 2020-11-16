//
//  NSObject+KPString.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/13.
//

#import <Foundation/Foundation.h>

@interface NSObject (KPString)

/**
 如果不清楚类型的时候获取string的时候调用该方法
 1. 如果本来就是string，则直接返回
 2. 如果支持 stringValue 则调用该selector
 3. 其他的直接返回description
 */
- (NSString *)kp_stringValue;

@end
