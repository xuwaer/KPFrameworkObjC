//
//  NSURL+KPExtensions.m
//  yqj_h5_demo_ios
//
//  Created by yiqijiao_xukaijun on 2017/11/23.
//  Copyright © 2017年 Jacky.Song. All rights reserved.
//

#import "NSURL+KPExtensions.h"

@implementation NSURL (KPExtensions)

- (NSDictionary *)queryParams
{
    if (self.query == nil) return [NSDictionary new];
    NSArray *values = [self.query componentsSeparatedByString:@"&"];
    if (values.count <= 0) return [NSDictionary new];
    NSMutableDictionary *returnValue = [NSMutableDictionary new];
    for (NSString *queryItem in values) {
        NSArray *items = [queryItem componentsSeparatedByString:@"="];
        if (items.count == 2) {
            [returnValue setValue:items[1] forKey:items[0]];
        }
    }
    return returnValue;
}

@end
