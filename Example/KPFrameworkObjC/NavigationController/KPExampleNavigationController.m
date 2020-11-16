//
//  KPViewPushController.m
//  KPFrameworkObjC_Example
//
//  Created by yiqijiao_xukaijun on 2018/4/23.
//  Copyright © 2018年 xuwaer@gmail.com. All rights reserved.
//

#import "KPExampleNavigationController.h"
#import <KPFrameworkObjC/UINavigationController+KPExtensions.h>
#import <KPFrameworkObjC/UIViewController+KPNavigation.h>

#import "KPExampleController01.h"

@interface KPExampleNavigationController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *btnPush;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *datasource;

@end


/**
 示例
 */
@interface KPExampleNavigationController (Example)

- (void)pushControllers;
- (void)replaceController;
- (void)replaceControllers;
- (void)replaceControllersAtIndex;
- (void)popToIndex;
- (void)popToCondition;
- (void)pushOrPop;
- (void)disablePopGesture;
- (void)presentLikePush;

@end

@implementation KPExampleNavigationController

- (NSString *)title
{
    return @"导航";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController kp_disablePopGesture:NO];
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self kp_contentUnderNavigationBar];
    [self.view addSubview:self.table];
    NSDictionary *views = @{@"table": self.table};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[table]-0-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[table]-0-|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:nil views:views]];
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.datasource[indexPath.row];
    cell.textLabel.minimumScaleFactor = 10;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self pushControllers];
            break;
        case 1:
            [self replaceController];
            break;
        case 2:
            [self replaceControllers];
            break;
        case 3:
            [self replaceControllersAtIndex];
            break;
        case 4:
            [self popToIndex];
            break;
        case 5:
            [self popToCondition];
            break;
        case 6:
            [self pushOrPop];
            break;
        case 7:
            [self disablePopGesture];
            break;
        case 8:
            [self presentLikePush];
            break;
        default:
            break;
    }
}

#pragma mark - getter/setter

- (NSArray *)datasource
{
    return @[@"1.push多个",
             @"2.replace当前",
             @"3.replace当前(多个)",
             @"4.replace指定index=0",
             @"5.回退到指定的index=0",
             @"6.回退到指定条件的Controller" ,
             @"7.push或回退(如果满足条件)",
             @"8.disable pop gesture",
             @"9.转场动画present like push"];
}

- (UITableView *)table
{
    if (_table == nil) {
        _table = [UITableView new];
        _table.translatesAutoresizingMaskIntoConstraints = NO;
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    }
    return _table;
}

@end

#import <KPFrameworkObjC/KPUIViewAnimationPush.h>
#import <KPFrameworkObjC/KPUIViewAnimationPop.h>
#import "KPExampleController01.h"

@implementation KPExampleNavigationController (Example)

#pragma mark - func

- (void)pushControllers
{
    UIViewController *controller01 = [UIViewController new];
    controller01.title = @"01";
    controller01.view.backgroundColor = [UIColor whiteColor];
    UIViewController *controller02 = [UIViewController new];
    controller02.title = @"02";
    controller02.view.backgroundColor = [UIColor whiteColor];
    UIViewController *controller03 = [UIViewController new];
    controller03.title = @"03";
    controller03.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController kp_pushViewControllers:@[controller01, controller02, controller03] animated:YES];
}

- (void)replaceController
{
    UIViewController *controller01 = [UIViewController new];
    controller01.title = @"01";
    controller01.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController kp_pushAtTopWithViewController:controller01 animated:YES];
}

- (void)replaceControllers
{
    UIViewController *controller01 = [UIViewController new];
    controller01.title = @"01";
    controller01.view.backgroundColor = [UIColor whiteColor];
    UIViewController *controller02 = [UIViewController new];
    controller02.title = @"02";
    controller02.view.backgroundColor = [UIColor whiteColor];
    UIViewController *controller03 = [UIViewController new];
    controller03.title = @"03";
    controller03.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController kp_pushAtTopWithViewControllers:@[controller01, controller02, controller03] animated:YES];
}

- (void)replaceControllersAtIndex
{
    UIViewController *controller01 = [UIViewController new];
    controller01.title = @"01";
    controller01.view.backgroundColor = [UIColor whiteColor];
    UIViewController *controller02 = [UIViewController new];
    controller02.title = @"02";
    controller02.view.backgroundColor = [UIColor whiteColor];
    UIViewController *controller03 = [UIViewController new];
    controller03.title = @"03";
    controller03.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController kp_pushAtIndex:0 withViewControllers:@[controller01, controller02, controller03] animated:YES];
}

- (void)popToIndex
{
    [self.navigationController kp_popToViewControllerByIndex:0 animated:YES];
}

- (void)popToCondition
{
    [self.navigationController kp_popToViewControllerBy:^BOOL(UIViewController *controller) {
        return [controller isKindOfClass:NSClassFromString(@"KPViewController")];
    } animated:YES];
}

- (void)pushOrPop
{
    UIViewController *controller01 = [UIViewController new];
    controller01.title = @"01";
    controller01.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController kp_pushOrPopToViewController:controller01 by:^BOOL(UIViewController *controller) {
        return [controller isKindOfClass:NSClassFromString(@"KPViewController")];
    } animated:YES];
}

- (void)disablePopGesture
{
    UIViewController *controller01 = [UIViewController new];
    controller01.title = @"01";
    controller01.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller01 animated:YES];
    [self.navigationController kp_disablePopGesture:YES];
}

- (void)presentLikePush
{
    [self presentViewController:[KPExampleController01 new] animated:YES completion:^{}];
}

@end
