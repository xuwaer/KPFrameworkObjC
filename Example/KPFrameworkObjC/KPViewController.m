//
//  KPViewController.m
//  KPFrameworkObjC
//
//  Created by xuwaer@gmail.com on 04/20/2018.
//  Copyright (c) 2018 xuwaer@gmail.com. All rights reserved.
//

#import "KPViewController.h"
#import <KPFrameworkObjC/UIViewController+KPNavigation.h>
#import "KPExampleNavigationController.h"
#import "KPExampleDevice.h"

@interface KPViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, strong) UIButton *btnPush;

@end

@interface KPViewController (Example)

- (void)showNavigationDemo:(NSString *)title;
- (void)showDeviceDemo:(NSString *)title;

@end

@implementation KPViewController

- (NSString *)title
{
    return @"Example";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
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
    NSString *name = self.datasource[indexPath.row];
    switch (indexPath.row) {
        case 0:
            [self showNavigationDemo:name];
            break;
        case 1:
            [self showDeviceDemo:name];
            break;
        default:
            break;
    }
}

#pragma mark - getter/setter

- (NSArray *)datasource
{
    return @[@"1.Navigation导航",
             @"2.Device信息"];
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

- (void)push
{
    [self.navigationController pushViewController:[KPExampleNavigationController new] animated:YES];
}

@end


@implementation KPViewController (Example)

- (void)showNavigationDemo:(NSString *)title
{
    UIViewController *controller = [KPExampleNavigationController new];
    controller.title = title;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showDeviceDemo:(NSString *)title
{
    UIViewController *controller = [KPExampleDevice new];
    controller.title = title;
    [self.navigationController pushViewController:controller animated:YES];

}

@end
