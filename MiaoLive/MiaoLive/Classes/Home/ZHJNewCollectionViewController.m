//
//  ZHJNewCollectionViewController.m
//  MiaoLive
//
//  Created by 张杰 on 16/7/17.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZHJNewCollectionViewController.h"
#import "ZHJNewCollectionViewCell.h"
#import "ZHJNetworkTool.h"
#import "ZHJNew.h"
#import <MJRefresh.h>
#import <MJExtension.h>

@interface ZHJNewCollectionViewController ()

// 存放所有的模型数据
@property (nonatomic, strong) NSMutableArray *allNewData;

@end

static NSString * const NewCellID = @"ZHJNewCollectionCell";

@implementation ZHJNewCollectionViewController

#pragma mark - 懒加载
- (NSMutableArray *)allNewData
{
    if (!_allNewData) {
        _allNewData = [NSMutableArray array];
    }
    return _allNewData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景yanse
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册collectionView
   [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHJNewCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NewCellID];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadNewData];
    
}

- (void)loadNewData
{
   
    // 从服务器获取数据
    [[ZHJNetworkTool shareTool]GET:[NSString stringWithFormat:@"http://live.9158.com/Room/GetNewRoomOnline?page=%d",1] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        // 监听进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功返回数据时回调
        // 字典转模型
        self.allNewData = [ZHJNew mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败回调
        ZJLog(@"数据请求失败！");
        
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.allNewData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHJNewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NewCellID forIndexPath:indexPath];

    cell.modelNew = self.allNewData[indexPath.row];
    
    return cell;
}


@end
