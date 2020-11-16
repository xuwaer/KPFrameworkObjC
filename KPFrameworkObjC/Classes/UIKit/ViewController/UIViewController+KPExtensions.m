//
//  UIViewController+KPAdditional.m
//  KPProjectModel
//
//  Created by 徐恺君 on 15/3/3.
//  Copyright (c) 2015年 kp. All rights reserved.
//

#import "UIViewController+KPExtensions.h"
#import "KPDeviceMacro.h"
#import "KPGlobalMacro.h"
#import "NSMutableArray+KPExtensions.h"
#import "NSArray+KPExtensions.h"
#import "UIBarButtonItem+KPCompatible.h"

@implementation UIViewController (KPExtensions)

+ (instancetype)kp_fromStoryboard:(NSString *)storyboard identifier:(NSString *)identifier bundle:(NSBundle *)bundle
{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:storyboard bundle:bundle];
    return [sb instantiateViewControllerWithIdentifier:identifier];
}

- (void)kp_pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)kp_dismiss
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (UIViewController *)kp_topViewController
{
    return [self topViewControllerFromViewController:self];
}

- (UIViewController *)topViewControllerFromViewController:(UIViewController *)controller
{
    if (controller) {
        while (controller.presentedViewController != nil && controller.isBeingDismissed == NO) {
            return [self topViewControllerFromViewController:controller.presentedViewController];
        }
        return controller;
    }
    else {
        return nil;
    }
}

@end
