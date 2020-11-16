//
//  UIView+YQJAnimaiton.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/10/12.
//

#import "UIView+YQJAnimation.h"

@implementation UIView (YQJAnimation)

- (BOOL)isRotating
{
    return [self.layer animationForKey:@"rotateRepeatedly"] != nil;
}
    
- (void)startRotateAnimation
{
    [self rotationAnimation];
}
    
- (void)stopRotateAnimation
{
    [self.layer removeAnimationForKey:@"rotateRepeatedly"];
}
    
#pragma mark - animation
    
-(void)rotationAnimation
{
    if (self.isRotating) return;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = [NSNumber numberWithFloat:0.0];
    rotate.toValue = [NSNumber numberWithFloat:6.2];
    rotate.repeatCount = CGFLOAT_MAX;
    rotate.duration = 1.0f;
    [self.layer addAnimation:rotate forKey:@"rotateRepeatedly"];
}
    
@end
