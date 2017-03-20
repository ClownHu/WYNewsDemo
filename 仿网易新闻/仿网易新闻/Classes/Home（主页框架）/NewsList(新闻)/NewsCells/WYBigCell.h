//
//  WYBigCell.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYNewsModel.h"

@interface WYBigCell : UITableViewCell

@property (nonatomic, strong) WYNewsModel *model;
@property (nonatomic, strong) UIImageView *newsImage;
@property (nonatomic, strong) UILabel *newsTitle;
@property (nonatomic, strong) UILabel *source;
@property (nonatomic, strong) UILabel *replyCount;

@end
