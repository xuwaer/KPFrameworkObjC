//
//  KPUIViewAnimationPop.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/11/28.
//

#import "KPUIViewAnimationPop.h"
#import "KPDeviceMacro.h"

@implementation KPUIViewAnimationPop

- (void)animationEvent:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.animDuration = 0.25;
    
    if (self.fromController == nil || self.toController == nil || self.containerView == nil)
        return;
    
    CGRect finalRect = [transitionContext finalFrameForViewController:self.toController];
    CGRect fromRect = CGRectOffset(finalRect, kpScreenWidth, 0);
    self.toController.view.frame = CGRectOffset(finalRect, 0 - kpScreenWidth, 0);
//    [self.containerView addSubview:self.toController.view];
    [UIView animateWithDuration:self.animDuration animations:^{
        self.fromController.view.alpha = 0.8;
        self.fromController.view.frame = fromRect;
        self.toController.view.frame = finalRect;
    } completion:^(BOOL finished) {
        self.fromController.view.alpha = 1;
        [self animationFinish:transitionContext];
    }];
}

@end
