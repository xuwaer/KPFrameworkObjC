//
//  KPBundleTool.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/9/28.
//

#import <Foundation/Foundation.h>

/**
 为pod代码正确方位bundle提供方法
 */
@interface KPBundleTool : NSObject

/**
 必须要是自己项目的class，不然会定位到其他pod项目中去
 */
+ (NSBundle *)bundleForClassString:(NSString *)classString bundleName:(NSString *)bundleName;

@end
