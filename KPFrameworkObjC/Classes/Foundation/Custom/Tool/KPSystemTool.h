//
//  KPSystemTool.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/12.
//

#import <Foundation/Foundation.h>

/**
 系统相关信息
 */
@interface KPSystemTool : NSObject

+ (NSString *)appName;
+ (NSString *)identifier;
+ (NSString *)appVersion;
+ (NSString *)buildVersion;

// 是否允许推送
+ (BOOL)isAllowAPNS;

@end

/**
 系统相关操作
 */
@interface KPSystemTool (Operation)

// 播放消息提示音
+ (void)noticeSound;
+ (void)noticeSoundWithNumber:(UInt32)number;
// 震动
+ (void)vibrate;
// 显示设置界面
+ (void)showPhoneSetting;
// 闪光灯
+ (void)lightFlash:(BOOL)isOn;

@end

/**
 网络相关信息
 */
#import <Reachability/Reachability.h>
typedef enum : int {
    KPNetworkInfo_Unknown,
    KPNetworkInfo_2G,
    KPNetworkInfo_3G,
    KPNetworkInfo_4G
} KPNetworkInfo;

@interface KPSystemTool (Network)

/**
 当前设备的数据网络类型(未知/2g/3g/4g)
 该方法不能用来判断是否有网.如果要判断是否有网,请使用 + (NetworkStatus)currentNetworkStatus;
 */
+ (KPNetworkInfo)currentNetworkInfo;

/**
 当前网络状态(wifi/数据流量/无网络)
 */
+ (NetworkStatus)currentNetworkStatus;

/**
 当前网络状态, 可读的
 */
+ (NSString *)currentNetworkStatusString;

/**
 监听网络状态变化
 需要首先调用 + (void)startNetworkNotifier;
 才会触发block变化
 */
+ (void)networkStatusChanged:(void(^)(NetworkStatus networkStatus))block;

+ (void)startNetworkNotifier;
+ (void)stopNetworkNotifier;

@end
