//
//  KPHardwareTool.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/12.
//

#import "KPHardwareTool.h"
#import <sys/utsname.h>

@implementation KPHardwareTool

+ (NSString *)UUID
{
    if ([self.device respondsToSelector:@selector(identifierForVendor)]) {
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    else {
        return nil;
    }
}

+ (CGFloat)screenWidth
{
    return CGRectGetWidth([[UIScreen mainScreen] bounds]);
}

+ (CGFloat)screenHeight
{
    return CGRectGetHeight([[UIScreen mainScreen] bounds]);
}

+ (CGFloat)screenScale
{
    return [[UIScreen mainScreen] scale];
}

+ (CGFloat)statusBarHeight
{
    return kpIsIPhoneXGen ? 44 : 20;
}

+ (NSString *)deviceModel
{
    return [self.device model];
}

+ (NSString *)deviceName
{
    return [self.device name];
}

+ (NSString *)systemName
{
    return [self.device systemName];
}

+ (NSString *)systemVersion
{
    return [self.device systemVersion];
}

+ (NSString *)deviceType
{
    struct utsname DT;
    // Get the system information
    uname(&DT);
    // Set the device type to the machine type
    NSString *deviceType = [NSString stringWithFormat:@"%s", DT.machine];
    return deviceType;
}


/**
 modal转换为可以读识别的设备型号，资料来自
 https://www.theiphonewiki.com/wiki/Models
 https://www.innerfence.com/howto/apple-ios-devices-dates-versions-instruction-sets
 */
+ (NSString *)humanReadableDeviceType
{
    if (TARGET_IPHONE_SIMULATOR) {
        return @"iPhone Simulator";
    }
    else {
        
        NSDictionary *deviceMap = @{// iPhone
                                    // ---
                                    // 2007‑06‑29
                                    @"iPhone1,1": @"iPhone (1st generation)",
                                    // 2008‑07‑11
                                    @"iPhone1,2": @"iPhone 3G",
                                    // 2009‑06‑19
                                    @"iPhone2,1": @"iPhone 3GS",
                                    // 2010‑06‑24
                                    @"iPhone3,1": @"iPhone 4 (GSM)",
                                    // 2012‑10‑09
                                    @"iPhone3,2": @"iPhone 4 (GSM Rev A)",
                                    // 2011‑02‑10
                                    @"iPhone3,3": @"iPhone 4 (CDMA)",
                                    // 2011‑10‑14
                                    @"iPhone4,1": @"iPhone 4S",
                                    // 2012‑09‑21
                                    @"iPhone5,1": @"iPhone 5 (GSM/LTE)",
                                    @"iPhone5,2": @"iPhone 5 (CDMA/LTE)",
                                    // 2013‑09‑20
                                    @"iPhone5,3": @"iPhone 5c (GSM/LTE)",
                                    @"iPhone5,4": @"iPhone 5c (CDMA/LTE)",
                                    @"iPhone6,1": @"iPhone 5s (GSM/LTE)",
                                    @"iPhone6,2": @"iPhone 5s (CDMA/LTE)",
                                    // 2014‑09‑19
                                    @"iPhone7,1": @"iPhone 6 Plus",
                                    @"iPhone7,2": @"iPhone 6",
                                    // 2015‑09‑25
                                    @"iPhone8,1": @"iPhone 6S",
                                    @"iPhone8,2": @"iPhone 6S Plus",
                                    // 2016‑03‑31
                                    @"iPhone8,4": @"iPhone SE",
                                    // 2016‑09‑16
                                    @"iPhone9,1": @"iPhone 7 (CDMA+GSM/LTE)",
                                    @"iPhone9,2": @"iPhone 7 (GSM/LTE)",
                                    @"iPhone9,3": @"iPhone 7 Plus (CDMA+GSM/LTE)",
                                    @"iPhone9,4": @"iPhone 7 Plus (GSM/LTE)",
                                    // 2017‑09‑22
                                    @"iPhone10,1":@"iPhone 8 (CDMA+GSM/LTE)",
                                    @"iPhone10,2":@"iPhone 8 Plus (CDMA+GSM/LTE)",
                                    @"iPhone10,4":@"iPhone 8 (GSM/LTE)",
                                    @"iPhone10,5":@"iPhone 8 Plus (GSM/LTE)",
                                    // 2017‑11‑03
                                    @"iPhone10,3":@"iPhone X (CDMA+GSM/LTE)",
                                    @"iPhone10,6":@"iPhone X (GSM/LTE)",
                                    // 2018‑10‑26
                                    @"iPhone11,8":@"iPhone XR",
                                    // 2018‑09‑21
                                    @"iPhone11,2":@"iPhone XS",
                                    @"iPhone11,6":@"iPhone XS Max (A1921/A2101/A2102)",
                                    @"iPhone11,4":@"iPhone XS Max (A2104)", // 无效代号
                                    // 2019‑09‑20
                                    @"iPhone12,1":@"iPhone 11",
                                    @"iPhone12,3":@"iPhone 11 Pro",
                                    @"iPhone12,5":@"iPhone 11 Pro Max",
                                    // 2020
                                    @"iPhone12,8":@"iPhone SE (2nd generation)",
                                    @"iPhone13,1":@"iPhone 12 mini",
                                    @"iPhone13,2":@"iPhone 12",
                                    @"iPhone13,3":@"iPhone 12 Pro",
                                    @"iPhone13,4":@"iPhone 12 Pro Max",
                                    // iPad
                                    // ---
                                    // 2010‑04‑03
                                    @"iPad1,1": @"iPad 1",
                                    // 2011‑03‑11
                                    @"iPad2,1": @"iPad 2 (Wi‑Fi)",
                                    @"iPad2,2": @"iPad 2 (GSM)",
                                    @"iPad2,3": @"iPad 2 (CDMA)",
                                    // 2012‑03‑16
                                    @"iPad2,4": @"iPad 2 (Wi‑Fi, A5R)",
                                    // 2012‑03‑16
                                    @"iPad3,1": @"iPad (3rd generation, Wi‑Fi)",
                                    @"iPad3,2": @"iPad (3rd generation, GSM/LTE)",
                                    @"iPad3,3": @"iPad (3rd generation, CDMA/LTE)",
                                    // 2012‑11‑02
                                    @"iPad2,5": @"iPad mini (Wi-Fi)",
                                    @"iPad3,4": @"iPad (4th generation, Wi‑Fi)",
                                    // 2012‑11‑16
                                    @"iPad2,6": @"iPad mini (GSM/LTE)",
                                    @"iPad2,7": @"iPad mini (CDMA/LTE)",
                                    @"iPad3,5": @"iPad (4th generation, CDMA/LTE)",
                                    @"iPad3,6": @"iPad (4th generation, GSM/LTE)",
                                    // 2013‑11‑01
                                    @"iPad4,1": @"iPad Air (Wi-Fi)",
                                    @"iPad4,2": @"iPad Air (LTE)",
                                    // 2013‑11‑12
                                    @"iPad4,4": @"iPad mini 2 (Wi‑Fi)",
                                    @"iPad4,5": @"iPad mini 2 (LTE)",
                                    // 2014‑03‑04
                                    @"iPad4,6": @"iPad mini 2 (China)",
                                    // 2014‑04‑01
                                    @"iPad4,3": @"iPad Air (China)",
                                    // 2014‑10‑24
                                    @"iPad4,7": @"iPad mini 3 (Wi‑Fi)",
                                    @"iPad4,8": @"iPad mini 3 (LTE)",
                                    @"iPad4,9": @"iPad mini 3 (China)",
                                    @"iPad5,3": @"iPad Air 2 (Wi-Fi)",
                                    @"iPad5,4": @"iPad Air 2 (LTE)",
                                    // 2015‑09‑09
                                    @"iPad5,1": @"iPad mini 4 (Wi-Fi)",
                                    @"iPad5,2": @"iPad mini 4 (LTE)",
                                    // 2015‑11‑11
                                    @"iPad6,7": @"iPad Pro (12.9-inch, Wi-Fi)",
                                    @"iPad6,8": @"iPad Pro (12.9-inch, LTE)",
                                    // 2016‑03‑24
                                    @"iPad6,3": @"iPad Pro (9.7‑inch, Wi‑Fi)",
                                    @"iPad6,4": @"iPad Pro (9.7‑inch, LTE)",
                                    // 2017‑03‑24
                                    @"iPad6,11":@"iPad (5th generation, Wi‑Fi)",
                                    @"iPad6,12":@"iPad (5th generation, LTE)",
                                    // 2017‑06‑13
                                    @"iPad7,1": @"iPad Pro (12.9‑inch, 2nd generation, Wi‑Fi)",
                                    @"iPad7,2": @"iPad Pro (12.9‑inch, 2nd generation, LTE)",
                                    @"iPad7,3": @"iPad Pro (10.5‑inch, Wi‑Fi)",
                                    @"iPad7,4": @"iPad Pro (10.5‑inch, LTE)",
                                    // 2018‑03‑27
                                    @"iPad7,5": @"iPad (6th generation, Wi‑Fi)",
                                    @"iPad7,6": @"iPad (6th generation, LTE)",
                                    // 2018‑11‑07
                                    @"iPad8,1": @"iPad Pro (11‑inch, Wi‑Fi)",
                                    @"iPad8,2": @"iPad Pro (11‑inch, Wi‑Fi, 1TB)",
                                    @"iPad8,3": @"iPad Pro (11‑inch, LTE)",
                                    @"iPad8,4": @"iPad Pro (11‑inch, LTE, 1TB)",
                                    @"iPad8,5": @"iPad Pro (12.9‑inch, 3rd generation, Wi‑Fi)",
                                    @"iPad8,6": @"iPad Pro (12.9‑inch, 3rd generation, LTE)",
                                    @"iPad8,7": @"iPad Pro (12.9‑inch, 3rd generation, Wi‑Fi, 1TB)",
                                    @"iPad8,8": @"iPad Pro (12.9‑inch, 3rd generation, LTE, 1TB)",
                                    // 2019‑03‑18
                                    @"iPad11,3": @"iPad Air (3rd generation, Wi‑Fi)",
                                    @"iPad11,4": @"iPad Air (3rd generation, LTE)",
                                    // 2019‑09‑30
                                    @"iPad7,11": @"iPad (7th generation, Wi‑Fi)",
                                    @"iPad7,12": @"iPad (7th generation, LTE)",
                                    // 2020
                                    @"iPad11,1": @"iPad Mini (5th generation, Wi‑Fi)",
                                    @"iPad11,2": @"iPad Mini (5th generation, LTE)",
                                    @"iPad11,6": @"iPad (8th generation, Wi‑Fi)",
                                    @"iPad11,7": @"iPad (8th generation, LTE)",
                                    @"iPad13,1": @"iPad Air (4th generation, Wi‑Fi)",
                                    @"iPad13,2": @"iPad Air (4th generation, LTE)",
                                    @"iPad8,9":  @"iPad Pro (11-inch, 2nd generation, Wi‑Fi)",
                                    @"iPad8,10": @"iPad Pro (11-inch, 2nd generation, LTE)",
                                    @"iPad8,11": @"iPad Pro (12.9-inch, 4th generation, Wi‑Fi)",
                                    @"iPad8,12": @"iPad Pro (12.9-inch, 4th generation, LTE)",
                                    // iPod
                                    // ---
                                    // 2007‑09‑14
                                    @"iPod1,1": @"iPod touch (1st generation)",
                                    // 2008‑09‑09
                                    @"iPod2,1": @"iPod touch (2nd generation)",
                                    // 2009‑09‑09
                                    @"iPod3,1": @"iPod touch (3rd generation)",
                                    // 2010‑09‑08
                                    @"iPod4,1": @"iPod touch (4th generation)",
                                    // 2012‑10‑15
                                    @"iPod5,1": @"iPod touch (5th generation)",
                                    // 2015‑07‑15
                                    @"iPod7,1": @"iPod touch (6th generation)",
                                    // 2019‑05‑28
                                    @"iPod9,1": @"iPod touch (7th generation)",
                                    };
        
        NSString *type = [self deviceType];
        NSString *device = deviceMap[type];
        return device != nil ? device : @"new device";
    }
}

#pragma mark - getter

+ (UIDevice *)device
{
    return [UIDevice currentDevice];
}

+ (BOOL)isIPhoneXGen
{
//    return kpIsIPhoneX || kpIsIPhoneXR || kpIsIPhoneXS || kpIsIPhoneXSMax || kpIsIPhone11 || kpIsIPhone11p || kpIsIPhone11pMax;
    // iphonex以后出的机型默认都是异形屏
    return !(kpIsIPhone1
             || kpIsIPhone3G
             || kpIsIPhone3GS
             || kpIsIPhone4
             || kpIsIPhone4s
             || kpIsIPhone5
             || kpIsIPhone5c
             || kpIsIPhone5s
             || kpIsIPhone6
             || kpIsIPhone6p
             || kpIsIPhoneSE
             || kpIsIPhone6s
             || kpIsIPhone6sp
             || kpIsIPhone7
             || kpIsIPhone7p
             || kpIsIPhone8
             || kpIsIPhone8p);
}

@end





// swift无法调用宏，使用以下方法调用
@implementation KPHardwareTool (Swift)

+ (BOOL)kp_isIPhone1       {return kpIsIPhone1;}
+ (BOOL)kp_isIPhone3G      {return kpIsIPhone3G;}
+ (BOOL)kp_isIPhone3GS     {return kpIsIPhone3GS;}
+ (BOOL)kp_isIPhone4       {return kpIsIPhone4;}
+ (BOOL)kp_isIPhone4s      {return kpIsIPhone4s;}
+ (BOOL)kp_isIPhone5       {return kpIsIPhone5;}
+ (BOOL)kp_isIPhone5c      {return kpIsIPhone5c;}
+ (BOOL)kp_isIPhone5s      {return kpIsIPhone5s;}
+ (BOOL)kp_isIPhone6       {return kpIsIPhone6;}
+ (BOOL)kp_isIPhone6p      {return kpIsIPhone6p;}
+ (BOOL)kp_isIPhoneSE      {return kpIsIPhoneSE;}
+ (BOOL)kp_isIPhone6s      {return kpIsIPhone6s;}
+ (BOOL)kp_isIPhone6sp     {return kpIsIPhone6sp;}
+ (BOOL)kp_isIPhone7       {return kpIsIPhone7;}
+ (BOOL)kp_isIPhone7p      {return kpIsIPhone7p;}
+ (BOOL)kp_isIPhone8       {return kpIsIPhone8;}
+ (BOOL)kp_isIPhone8p      {return kpIsIPhone8p;}
+ (BOOL)kp_isIPhoneX       {return kpIsIPhoneX;}
+ (BOOL)kp_isIPhoneXR      {return kpIsIPhoneXR;}
+ (BOOL)kp_isIPhoneXS      {return kpIsIPhoneXS;}
+ (BOOL)kp_isIPhoneXSMax   {return kpIsIPhoneXSMax;}
+ (BOOL)kp_isIPhone11      {return kpIsIPhone11;}
+ (BOOL)kp_isIPhone11p     {return kpIsIPhone11p;}
+ (BOOL)kp_isIPhone11pMax  {return kpIsIPhone11pMax;}
+ (BOOL)kp_isIPhoneSE2     {return kpIsIPhoneSE2;}
+ (BOOL)kp_isIPhone12Mini  {return kpIsIPhone12Mini;}
+ (BOOL)kp_isIPhone12      {return kpIsIPhone12;}
+ (BOOL)kp_isIPhone12Pro   {return kpIsIPhone12Pro;}
+ (BOOL)kp_isIPhone12ProMax     {return kpIsIPhone12ProMax;}

@end
