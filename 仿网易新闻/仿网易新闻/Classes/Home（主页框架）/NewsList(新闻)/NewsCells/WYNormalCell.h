//
//  WYNormalCell.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYNewsModel.h"

@interface WYNormalCell : UITableViewCell

@property (nonatomic, strong) WYNewsModel *model;

/**
 图片
 */
@property (nonatomic, strong) UIImageView *newsImage;

/**
 标题
 */
@property (nonatomic, strong) UILabel *newsTitle;

/**
 来源
 */
@property (nonatomic, strong) UILabel *source;

/**
 回复数
 */
@property (nonatomic, strong) UILabel *replyCount;


@end
