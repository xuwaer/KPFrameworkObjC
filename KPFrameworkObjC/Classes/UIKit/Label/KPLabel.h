//
//  VerticalTopLabel.h
//  Cicada
//
//  Created by 白松灵 on 14/7/31.
//  Copyright (c) 2014年 7jj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KPVerticalAlignment) {
    KPVerticalAlignmentTop        = 0,                    // 顶部对齐
    KPVerticalAlignmentMiddle,                            // 居中对齐
    KPVerticalAlignmentBottom,                            // 底部对齐
};

@interface KPLabel : UILabel

/**
 *  对齐方式
 */
@property (nonatomic, assign) KPVerticalAlignment verticalAlignment;

@property (nonatomic, readonly) int lines;

@end
