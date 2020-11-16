//
//  KPUIViewAnimationControl.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/11/28.
//

#import "KPUIViewAnimationControl.h"

@interface KPUIViewAnimationControl ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end


@implementation KPUIViewAnimationControl

- (instancetype)init
{
    if (self = [super init]) {
        self.animDuration = 0.45;
    }
    return self;
}

#pragma mark - public

- (void)animationEvent:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

- (void)animationFinish:(id<UIViewControllerContextTransitioning>)transitionContext;
{
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}

#pragma mark - UIViewControllerAnimatedTransitioning delegate

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.animDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView = transitionContext.containerView;
    
    [self animationEvent:transitionContext];
}

@end
