//
//  KPUIViewAnimationControl.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/11/28.
//

#import <UIKit/UIKit.h>

/**
 转场动画
 */
@interface KPUIViewAnimationControl : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval animDuration;
@property (nonatomic, strong) UIViewController *fromController;
@property (nonatomic, strong) UIViewController *toController;
@property (nonatomic, strong) UIView *containerView;

/**
 动画操作,在这里重写
 */
- (void)animationEvent:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 需要子类动画完成后手动调用
 */
- (void)animationFinish:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
