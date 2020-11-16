//
//  KPExampleController01.m
//  KPFrameworkObjC_Example
//
//  Created by yiqijiao_xukaijun on 2018/4/28.
//  Copyright © 2018年 xuwaer@gmail.com. All rights reserved.
//

#import "KPExampleController01.h"
#import <KPFrameworkObjC/KPUIViewAnimationPush.h>
#import <KPFrameworkObjC/KPUIViewAnimationPop.h>

@interface KPExampleController01 () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentTransition;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftItem;
@property (weak, nonatomic) IBOutlet UIScreenEdgePanGestureRecognizer *panGesture;

@end

@implementation KPExampleController01

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)pan:(UIScreenEdgePanGestureRecognizer *)gesture
{
    CGFloat progress = [gesture translationInView:self.view].x / self.view.bounds.size.width;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.percentTransition = [UIPercentDrivenInteractiveTransition new];
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.percentTransition updateInteractiveTransition:progress];
    }
    else if (gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateEnded) {
        if (progress > 0.5) {
            [self.percentTransition finishInteractiveTransition];
        }
        else {
            [self.percentTransition cancelInteractiveTransition];
        }
        self.percentTransition = nil;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[KPUIViewAnimationPush alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[KPUIViewAnimationPop alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.percentTransition;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.percentTransition;
}

@end
