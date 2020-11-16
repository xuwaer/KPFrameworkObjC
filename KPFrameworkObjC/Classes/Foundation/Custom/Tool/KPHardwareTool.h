//
//  KPHardwareTool.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/12.
//

#import <Foundation/Foundation.h>
#import "NSString+KPExtensions.h"

/**
 设备相关信息
 */
@interface KPHardwareTool : NSObject

+ (NSString *)UUID;

+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (CGFloat)screenScale;
+ (CGFloat)statusBarHeight; // iPhoneX = 44, other = 20

+ (NSString *)deviceModel; // e.g. @"iPhone", @"iPod touch"
+ (NSString *)deviceName; // e.g. "My iPhone"
+ (NSString *)systemName; // e.g. @"iOS"
+ (NSString *)systemVersion; // e.g. @"4.0"
+ (NSString *)deviceType;   // e.g. @"iPhone10,1"
+ (NSString *)humanReadableDeviceType;  // e.g. @"iPhone 8 (A1863/A1906)"

+ (BOOL)isIPhoneXGen; // 是否异形屏

@end


#define kpIsScreenInch_3_5          [KPHardwareTool screenHeight] == 480
#define kpIsScreenInch_4            [KPHardwareTool screenHeight] == 568
#define kpIsScreenInch_4_7          [KPHardwareTool screenHeight] == 667
#define kpIsScreenInch_5_5          [KPHardwareTool screenHeight] == 736
#define kpIsScreenInch_5_8          [KPHardwareTool screenHeight] == 812
#define kpIsScreenInch_6_1          [KPHardwareTool screenHeight] == 844
#define kpIsScreenInch_6_7          [KPHardwareTool screenHeight] == 926
// 状态栏高度
#define kpStatusBarHeight           [KPHardwareTool statusBarHeight]

// 根据width，height，scale判断屏幕是否符合
#define kpScreenMatch(width, height, scale)      ([KPHardwareTool screenWidth] == width &&  [KPHardwareTool screenHeight] == height && [KPHardwareTool screenScale] == scale)

// 因为非真机状态下, 通过屏幕来获取模拟器类型
#if DEBUG
#define kpIsIPhone1       [[KPHardwareTool deviceType] kp_match:@"^iPhone1,1$"]
#define kpIsIPhone3G      [[KPHardwareTool deviceType] kp_match:@"^iPhone1,2$"]
#define kpIsIPhone3GS     kpScreenMatch(320, 480, 1)
#define kpIsIPhone4       kpScreenMatch(320, 480, 2)
#define kpIsIPhone4s      kpScreenMatch(320, 480, 2)
#define kpIsIPhone5       kpScreenMatch(320, 568, 2)
#define kpIsIPhone5c      kpScreenMatch(320, 568, 2)
#define kpIsIPhone5s      kpScreenMatch(320, 568, 2)
#define kpIsIPhoneSE      kpScreenMatch(320, 568, 2)
#define kpIsIPhone6       kpScreenMatch(375, 667, 2)
#define kpIsIPhone6s      kpScreenMatch(375, 667, 2)
#define kpIsIPhone7       kpScreenMatch(375, 667, 2)
#define kpIsIPhone8       kpScreenMatch(375, 667, 2)
#define kpIsIPhone6p      kpScreenMatch(414, 736, 3)
#define kpIsIPhone6sp     kpScreenMatch(414, 736, 3)
#define kpIsIPhone7p      kpScreenMatch(414, 736, 3)
#define kpIsIPhone8p      kpScreenMatch(414, 736, 3)
#define kpIsIPhoneX       kpScreenMatch(375, 812, 3)
#define kpIsIPhoneXS      kpScreenMatch(375, 812, 3)
#define kpIsIPhone11p     kpScreenMatch(375, 812, 3)
#define kpIsIPhoneXR      kpScreenMatch(414, 896, 2)
#define kpIsIPhone11      kpScreenMatch(414, 896, 2)
#define kpIsIPhoneXSMax   kpScreenMatch(414, 896, 3)
#define kpIsIPhone11pMax  kpScreenMatch(414, 896, 3)
#define kpIsIPhoneSE2     kpScreenMatch(375, 667, 2)
#define kpIsIPhone12Mini  kpScreenMatch(360, 780, 3)
#define kpIsIPhone12      kpScreenMatch(390, 844, 3)
#define kpIsIPhone12Pro   kpScreenMatch(390, 844, 3)
#define kpIsIPhone12ProMax      kpScreenMatch(428, 926, 3)
#else
#define kpIsIPhone1       [[KPHardwareTool deviceType] kp_match:@"^iPhone1,1$"]
#define kpIsIPhone3G      [[KPHardwareTool deviceType] kp_match:@"^iPhone1,2$"]
#define kpIsIPhone3GS     [[KPHardwareTool deviceType] kp_match:@"^iPhone2,\\d$"]
#define kpIsIPhone4       [[KPHardwareTool deviceType] kp_match:@"^iPhone3,\\d$"]
#define kpIsIPhone4s      [[KPHardwareTool deviceType] kp_match:@"^iPhone4,\\d$"]
#define kpIsIPhone5       [[KPHardwareTool deviceType] kp_match:@"^iPhone5,[12]$"]
#define kpIsIPhone5c      [[KPHardwareTool deviceType] kp_match:@"^iPhone5,[34]$"]
#define kpIsIPhone5s      [[KPHardwareTool deviceType] kp_match:@"^iPhone6,\\d$"]
#define kpIsIPhone6       [[KPHardwareTool deviceType] kp_match:@"^iPhone7,2$"]
#define kpIsIPhone6p      [[KPHardwareTool deviceType] kp_match:@"^iPhone7,1$"]
#define kpIsIPhoneSE      [[KPHardwareTool deviceType] kp_match:@"^iPhone8,4$"]
#define kpIsIPhone6s      [[KPHardwareTool deviceType] kp_match:@"^iPhone8,1$"]
#define kpIsIPhone6sp     [[KPHardwareTool deviceType] kp_match:@"^iPhone8,2$"]
#define kpIsIPhone7       [[KPHardwareTool deviceType] kp_match:@"^iPhone9,[13]$"]
#define kpIsIPhone7p      [[KPHardwareTool deviceType] kp_match:@"^iPhone9,[24]$"]
#define kpIsIPhone8       [[KPHardwareTool deviceType] kp_match:@"^iPhone10,[14]$"]
#define kpIsIPhone8p      [[KPHardwareTool deviceType] kp_match:@"^iPhone10,[25]$"]
#define kpIsIPhoneX       [[KPHardwareTool deviceType] kp_match:@"^iPhone10,[36]$"]
#define kpIsIPhoneXR      [[KPHardwareTool deviceType] kp_match:@"^iPhone11,8$"]
#define kpIsIPhoneXS      [[KPHardwareTool deviceType] kp_match:@"^iPhone11,2$"]
#define kpIsIPhoneXSMax   [[KPHardwareTool deviceType] kp_match:@"^iPhone11,[64]$"]
#define kpIsIPhone11      [[KPHardwareTool deviceType] kp_match:@"^iPhone12,1$"]
#define kpIsIPhone11p     [[KPHardwareTool deviceType] kp_match:@"^iPhone12,3$"]
#define kpIsIPhone11pMax  [[KPHardwareTool deviceType] kp_match:@"^iPhone12,5$"]
#define kpIsIPhoneSE2     [[KPHardwareTool deviceType] kp_match:@"^iPhone12,8$"]
#define kpIsIPhone12Mini  [[KPHardwareTool deviceType] kp_match:@"^iPhone13,1$"]
#define kpIsIPhone12      [[KPHardwareTool deviceType] kp_match:@"^iPhone13,2$"]
#define kpIsIPhone12Pro   [[KPHardwareTool deviceType] kp_match:@"^iPhone13,3$"]
#define kpIsIPhone12ProMax  [[KPHardwareTool deviceType] kp_match:@"^iPhone13,4$"]
#endif

// 判断异形屏，从X开始的以后版本均为异形屏，需要特殊处理
#define kpIsIPhoneXGen    [KPHardwareTool isIPhoneXGen]

// swift无法调用宏，使用以下方法调用
@interface KPHardwareTool (Swift)

+ (BOOL)kp_isIPhone1;
+ (BOOL)kp_isIPhone3G;
+ (BOOL)kp_isIPhone3GS;
+ (BOOL)kp_isIPhone4;
+ (BOOL)kp_isIPhone4s;
+ (BOOL)kp_isIPhone5;
+ (BOOL)kp_isIPhone5c;
+ (BOOL)kp_isIPhone5s;
+ (BOOL)kp_isIPhone6;
+ (BOOL)kp_isIPhone6p;
+ (BOOL)kp_isIPhoneSE;
+ (BOOL)kp_isIPhone6s;
+ (BOOL)kp_isIPhone6sp;
+ (BOOL)kp_isIPhone7;
+ (BOOL)kp_isIPhone7p;
+ (BOOL)kp_isIPhone8;
+ (BOOL)kp_isIPhone8p;
+ (BOOL)kp_isIPhoneX;
+ (BOOL)kp_isIPhoneXR;
+ (BOOL)kp_isIPhoneXS;
+ (BOOL)kp_isIPhoneXSMax;
+ (BOOL)kp_isIPhone11;
+ (BOOL)kp_isIPhone11p;
+ (BOOL)kp_isIPhone11pMax;

@end
