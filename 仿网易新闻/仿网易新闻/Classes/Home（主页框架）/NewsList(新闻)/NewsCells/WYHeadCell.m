//
//  WYHeadCell.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYHeadCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation WYHeadCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //添加子控件
        [self setupUI];
    }
    
    return self;
}

- (void) setupUI {
    //MARK:1. 创建并添加子控件
    _newsImage = [[UIImageView alloc] init];
    [self.contentView addSubview:_newsImage];
    
    _newsTitle = [[UILabel alloc] init];
    [self.contentView addSubview:_newsTitle];
    _newsTitle.font = [UIFont systemFontOfSize:18];
    _newsTitle.textColor = [UIColor whiteColor];
    _newsTitle.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    _newsTitle.numberOfLines = 0;
    
    //MARK:2. 自动布局
    [_newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(126);
        make.bottom.equalTo(self.contentView);
    }];
    
    [_newsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_newsImage);
        make.bottom.equalTo(_newsImage);
        make.height.mas_equalTo(28);
    }];
}

- (void) setModel:(WYNewsModel *)model {
    _model = model;
    //赋值
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:_model.imgsrc]];
    _newsTitle.text = _model.title;
}

@end
