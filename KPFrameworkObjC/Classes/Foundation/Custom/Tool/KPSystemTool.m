//
//  KPSystemTool.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/12.
//

#import "KPSystemTool.h"
#import "KPDeviceMacro.h"
#import "KPHardwareTool.h"
#import "NSMutableDictionary+KPExtensions.h"

@implementation KPSystemTool

+ (NSString *)appName
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *appName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [bundle objectForInfoDictionaryKey:@"CFBundleName"];
    }
    return appName;
}

+ (NSString *)identifier
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

+ (NSString *)appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)buildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (BOOL)isAllowAPNS
{
    if (kpiOS8_OR_LATER) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        return UIUserNotificationTypeNone != setting.types;
    }
    else {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        return UIRemoteNotificationTypeNone != type;
    }
}

@end

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "UIApplication+KPExtensions.h"
@implementation KPSystemTool (Operation)

+ (void)noticeSound
{
    AudioServicesPlaySystemSound(1007);
}

+ (void)noticeSoundWithNumber:(UInt32)number
{
    AudioServicesPlaySystemSound(number);
}

/**
 *  震动
 */
+ (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void)showPhoneSetting
{
    NSURL *url = nil;
    if (kpiOS8_OR_LATER)
        url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    else
        url = [NSURL URLWithString:@"prefs:root=INTERNET_TETHERING"];
    [UIApplication kp_openURLCompatible:url];
}

+ (void)lightFlash:(BOOL)isOn
{
    if (isOn) {
        //打开闪光灯
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        NSError *error = nil;
        
        if ([captureDevice hasTorch]) {
            BOOL locked = [captureDevice lockForConfiguration:&error];
            if (locked) {
                captureDevice.torchMode = AVCaptureTorchModeOn;
                [captureDevice unlockForConfiguration];
            }
        }
    }
    else {
        //关闭闪光灯
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOff];
            [device unlockForConfiguration];
        }
    }
}

@end



#import <CoreTelephony/CTTelephonyNetworkInfo.h>

static Reachability *networkReachability = nil;
@implementation KPSystemTool (Network)

+ (KPNetworkInfo)currentNetworkInfo
{
    NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                               CTRadioAccessTechnologyGPRS,
                               CTRadioAccessTechnologyCDMA1x];
    
    NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,
                               CTRadioAccessTechnologyWCDMA,
                               CTRadioAccessTechnologyHSUPA,
                               CTRadioAccessTechnologyCDMAEVDORev0,
                               CTRadioAccessTechnologyCDMAEVDORevA,
                               CTRadioAccessTechnologyCDMAEVDORevB,
                               CTRadioAccessTechnologyeHRPD];
    
    NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
    
    if (kpiOS7_OR_LATER) {
        CTTelephonyNetworkInfo *teleInfo= [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
        if ([typeStrings4G containsObject:accessString]) {
            return KPNetworkInfo_4G;
        } else if ([typeStrings3G containsObject:accessString]) {
            return KPNetworkInfo_3G;
        } else if ([typeStrings2G containsObject:accessString]) {
            return KPNetworkInfo_2G;
        } else {
            return KPNetworkInfo_Unknown;
        }
    } else {
        return KPNetworkInfo_Unknown;
    }
}

+ (NetworkStatus)currentNetworkStatus
{
    return [[self reachability] currentReachabilityStatus];
}

+ (NSString *)currentNetworkStatusString
{
    NSString *resultValue = @"unknown";
    switch ([self currentNetworkStatus]) {
        case NotReachable:
            resultValue = @"No wifi or cellular";
            break;
        case ReachableViaWiFi:
            resultValue = @"Wifi";
            break;
        case ReachableViaWWAN:
            resultValue = [self currentNetworkInfoString];
            break;
        default:
            break;
    }
    return resultValue;
}

+ (NSString *)currentNetworkInfoString
{
    NSString *returnValue = @"unknown";
    switch ([self currentNetworkInfo]) {
        case KPNetworkInfo_2G:
            returnValue = @"2G";
            break;
        case KPNetworkInfo_3G:
            returnValue = @"3G";
            break;
        case KPNetworkInfo_4G:
            returnValue = @"4G";
            break;
        default:
            break;
    }
    return returnValue;
}

+ (void)networkStatusChanged:(void (^)(NetworkStatus))block
{
    Reachability *reachability = [self reachability];
    reachability.reachableBlock = ^(Reachability *reachability) {
        if (block) block([reachability currentReachabilityStatus]);
    };
    reachability.unreachableBlock = ^(Reachability *reachability) {
        if (block) block(NotReachable);
    };
}

+ (void)startNetworkNotifier
{
    [[self reachability] startNotifier];
}

+ (void)stopNetworkNotifier
{
    [[self reachability] stopNotifier];
}

+ (Reachability *)reachability
{
    if (networkReachability == nil)
        networkReachability = [Reachability reachabilityForInternetConnection];
    return networkReachability;
}

@end
