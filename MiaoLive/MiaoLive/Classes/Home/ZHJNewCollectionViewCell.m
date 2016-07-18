//
//  ZHJNewCollectionViewCell.m
//  MiaoLive
//
//  Created by 张杰 on 16/7/18.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZHJNewCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@interface ZHJNewCollectionViewCell()

/** 主播所在地址 */
@property (weak, nonatomic) IBOutlet UIButton *positionButton;
/** 主播的星星等级 */
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
/** 主播昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
/** 主播的头像 */
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;


@end


@implementation ZHJNewCollectionViewCell


- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

// 只要有人调用ZHJNew的set方法就更行ui
- (void)setModelNew:(ZHJNew *)modelNew
{
    _modelNew = modelNew;
    
    // 更新地址
    self.positionButton.titleLabel.text = modelNew.position;
    
    // 更新昵称
    self.nickNameLabel.text = modelNew.nickname;
    
    //更新头像
    [self.userHeadImageView sd_setImageWithURL:[NSURL URLWithString:modelNew.photo]];
    
}

// 创建一个快速构造方法
+ (instancetype)cell
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

@end
