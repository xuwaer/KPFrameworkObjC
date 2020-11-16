//
//  KPBundleTool.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/9/28.
//

#import "KPBundleTool.h"

@implementation KPBundleTool

/**
 必须要是自己项目的class，不然会定位到其他pod项目中去
 */
+ (NSBundle *)bundleForClassString:(NSString *)classString bundleName:(NSString *)bundleName
{
    NSBundle *projBundle = [NSBundle bundleForClass:NSClassFromString(classString)];
    return [NSBundle bundleWithURL:[projBundle URLForResource:bundleName withExtension:@"bundle"]];
}

@end
