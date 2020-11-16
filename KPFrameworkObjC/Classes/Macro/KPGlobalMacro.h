//
//  KPGlobalMacro.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

// 通用宏
#define kpRandomNumber             (long long)([[NSDate date] timeIntervalSince1970] * 1000 * 100) + (int)(arc4random() % 100)
#define kpRandomString             [@(kpRandomNumber) stringValue]

// 集合判断
#define kpStringNotEmpty(str)      (str && [str isKindOfClass:NSString.class] && (str.length > 0))
#define kpStringTrimNotEmpty(str)  (str && [str isKindOfClass:NSString.class] && ([str kp_trim].length > 0))
#define kpArrayNotEmpty(arr)       (arr && [arr isKindOfClass:NSArray.class] && (arr.count > 0))
#define kpDictionaryNotEmpty(dic)  (dic && [dic isKindOfClass:NSDictionary.class] && (dic.count > 0))
#define kpSetNotEmpty(set)         (set && [set isKindOfClass:NSSet.class] && (set.count > 0))

// 空数据处理
#define kpNilProtection(_value_) (_value_ ? _value_ : [NSNull null])

#define kpNNilStringDefault(str, _default)          (str && [str isKindOfClass:NSString.class]) ? str : _default
#define kpNNilString(str)                           kpNNilStringDefault(str, @"")
#define kpNNilNumberDefault(num, _default)          (num && [num isKindOfClass:NSNumber.class]) ? num : _default
#define kpNNilNumber(num)                           kpNNilNumberDefault(num, @(0))
#define kpNNilDateDefault(date, _default)           (date && [NSDate isKindOfClass:NSDate.class]) ? date : _default
#define kpNNilDate(date)                            kpNNilDateDefault(date, [NSDate date])
#define kpNNilArrayDefault(array, _default)         (array && [array isKindOfClass:NSArray.class]) ? array : _default
#define kpNNilArray(array)                          kpNNilArrayDefault(array, [NSArray new])
#define kpNNilDictionaryDefault(dic, _default)      (dic && [dic isKindOfClass:NSDictionary.class]) ? dic : _default
#define kpNNilDictionary(dic)                       kpNNilDictionaryDefault(dic, [NSDictionary new])

#define kpIsEmptyString(s)                          (s && [s isKindOfClass:NSString.class]) ? s.length <= 0 : YES
#define kpIsEmptyArray(a)                           (a && [a isKindOfClass:NSArray.class]) ? a.count <= 0 : YES
#define kpIsEmptyDictionary(d)                      (d && [d isKindOfClass:NSDictionary.class]) ? d.count <= 0 : YES
#define kpIsEmpty(obj)                              obj == nil


// 线程
#define kpDispatch_async_main(b)              dispatch_async(dispatch_get_main_queue(), b)
#define kpDispatch_async_default(b)           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), b)
#define kpDispatch_async_background(b)        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), b)



// 强弱引用
#define kpWeakSelf(type) __weak typeof(type) weak##type = type;
#define kpStrongSelf(type) __strong typeof(type) type = weak##type;



// 颜色
#define kpRGBColor(r, g, b)       [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define kpRGBAColor(r, g, b, a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kpHexRGBColor(rgbValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kpHexRGBAColor(rgbValue,a)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define kpRGBRandomColor              [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
