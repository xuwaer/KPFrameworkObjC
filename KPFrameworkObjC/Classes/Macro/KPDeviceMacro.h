//
//  KPDeviceMacro.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

// 设备信息相关宏

// 屏幕信息
#define kpScreenBounds                      [[UIScreen mainScreen] bounds]
#define kpScreenWidth                       [[UIScreen mainScreen] bounds].size.width
#define kpScreenHeight                      [[UIScreen mainScreen] bounds].size.height
#define kpScreenScale                       [[UIScreen mainScreen] scale]
#define kpScreenPt(pxValue)                 (CGFloat)pxValue / kpScreenScale

// 系统信息
#define kpiOS11_OR_LATER                    @available(iOS 11.0, *)
#define kpiOS10_OR_LATER                    @available(iOS 10.0, *)
#define kpiOS9_OR_LATER                     @available(iOS 9.0, *)
#define kpiOS8_OR_LATER                     @available(iOS 8.0, *)
#define kpiOS7_OR_LATER                     @available(iOS 7.0, *)
#define kpiOS6_OR_LATER                     @available(iOS 6.0, *)
#define kpiOS5_OR_LATER                     @available(iOS 5.0, *)
#define kpiOS4_OR_LATER                     @available(iOS 4.0, *)
#define kpiOS3_OR_LATER                     @available(iOS 3.0, *)

#define kpSystemVerEqualTo(v)               [UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame
#define kpSystemVerGreaterThan(v)          ［[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending
#define kpSystemVerGreaterThanOrEqualTo(v)  [UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending
#define kpSystemVerLessThan(v)             ［[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending
#define kpSystemVerLessThanOrEqualTo(v)    ［[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending

// app信息
#define kpAppBuildVer                       [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey]
#define kpAppVer                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kpAppName                           [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey]
#define kpAppBundleID                       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

// 设备信息
// 更详细的信息 @see KPHardwareTool.h
#define kpDeviceVer                         [[[UIDevice currentDevice] systemVersion] floatValue]
#define kpDeviceName                        [[[UIDevice currentDevice] systemVersion] name]
#define kpDeviceModel                       [[[UIDevice currentDevice] systemVersion] model]
#define kpCurrentLanguage                   [[NSLocale preferredLanguages] objectAtIndex:0]
#define kpIsiPhone                          UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone
#define kpIsiPad                            UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
