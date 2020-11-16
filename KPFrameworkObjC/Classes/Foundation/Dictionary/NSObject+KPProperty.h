//
//  NSObject+KPProperty.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/14.
//

#import <Foundation/Foundation.h>

@interface NSObject (KPProperty)

/**
 生成proper的字典(如果property的值为nil，则字典中的值为NSNull)
 */
- (NSDictionary *)kp_properties;

@end
