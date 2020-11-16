//
//  NSError+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (KPExtensions)

/**
 生成error
 domain默认为Bundle ID
 message -> NSLocalizedDescriptionKey
 */
+ (instancetype)kp_errorWithCode:(NSInteger)code message:(NSString *)message;

/**
 NSLocalizedDescriptionKey -> kp_message
 如果没有userinfo[NSLocalizedDescriptionKey],则会返回nil
 */
@property (nonatomic, strong, readonly) NSString *kp_message;

@end
