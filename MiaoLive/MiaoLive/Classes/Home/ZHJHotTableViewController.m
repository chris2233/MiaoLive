//
//  ZHJHotTableViewController.m
//  MiaoLive
//
//  Created by 张杰 on 16/7/17.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZHJHotTableViewController.h"

@interface ZHJHotTableViewController ()

@end

@implementation ZHJHotTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 配置基本配置
    [self setupTableView];

}

- (void)setupTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
    }
    return cell;
}


@end
