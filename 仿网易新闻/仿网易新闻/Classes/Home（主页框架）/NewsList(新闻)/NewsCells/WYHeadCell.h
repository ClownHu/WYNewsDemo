//
//  WYHeadCell.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYNewsModel.h"

@interface WYHeadCell : UITableViewCell

@property (nonatomic, strong) WYNewsModel *model;
@property (nonatomic, strong) UIImageView *newsImage;
@property (nonatomic, strong) UILabel *newsTitle;

@end
