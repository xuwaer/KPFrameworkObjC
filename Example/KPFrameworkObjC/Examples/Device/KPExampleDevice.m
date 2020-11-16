//
//  KPExampleDevice.m
//  KPFrameworkObjC_Example
//
//  Created by xukj on 2019/10/8.
//  Copyright © 2019 xuwaer@gmail.com. All rights reserved.
//

#import "KPExampleDevice.h"
#import <KPFrameworkObjC/KPHardwareTool.h>

@interface KPExampleDevice ()

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation KPExampleDevice

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    cell.textLabel.minimumScaleFactor = 10;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.minimumScaleFactor = 10;
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSDictionary *data = self.datasource[indexPath.row];
    cell.textLabel.text = data[@"key"];
    cell.detailTextLabel.text = data[@"value"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)screen
{
    CGFloat width = [KPHardwareTool screenWidth];
    CGFloat height = [KPHardwareTool screenHeight];
    CGFloat scale = [KPHardwareTool screenScale];
    return [NSString stringWithFormat:@"%dx%d", [@(width * scale) intValue], [@(height * scale) intValue]];
}

#pragma mark - getter/setter

- (NSArray *)datasource
{
    if (_datasource == nil) {
        _datasource = @[@{@"key": @"Model", @"value": [KPHardwareTool deviceModel]},
                        @{@"key": @"Name", @"value": [KPHardwareTool deviceName]},
                        @{@"key": @"OS", @"value": [KPHardwareTool systemName]},
                        @{@"key": @"OS Version", @"value": [KPHardwareTool systemVersion]},
                        @{@"key": @"Device Type", @"value": [KPHardwareTool deviceType]},
                        @{@"key": @"Description", @"value": [KPHardwareTool humanReadableDeviceType]},
                        @{@"key": @"Screen", @"value":[self screen]},
                        @{@"key": @"@x", @"value": [NSString stringWithFormat:@"x%d", [@([KPHardwareTool screenScale]) intValue]]},
                        @{@"key": @"异形屏", @"value": [KPHardwareTool isIPhoneXGen] ? @"是" : @"否"},
                        ];
    }
    return _datasource;
}

@end
