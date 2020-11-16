//
//  NSDictionary+KPTool.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 工具类.提供代码生成等便捷的操作(不应该在业务逻辑里使用该分类)
 */
@interface NSDictionary (KPTool)

/**
 在实际开发中，我们经常需要根据字典来建模型。kp_createPropertyCode，自动生成属性并打印在控制台。
 直接复制，新建模型类，粘贴使用。
 */
- (void)kp_createPropertyCode;

@end
