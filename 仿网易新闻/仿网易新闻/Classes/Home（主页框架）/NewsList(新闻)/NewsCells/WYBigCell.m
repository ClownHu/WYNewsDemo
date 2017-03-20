//
//  WYBigCell.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYBigCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@implementation WYBigCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void) setupUI {
    //1. 创建并添加子控件
    _newsImage = [[UIImageView alloc] init];
    [self.contentView addSubview:_newsImage];
    
    _newsTitle = [[UILabel alloc] init];
    [self.contentView addSubview:_newsTitle];
    _newsTitle.font = [UIFont systemFontOfSize:18];
    _newsTitle.textColor = [UIColor blackColor];
    _newsTitle.numberOfLines = 0;
    
    _source = [[UILabel alloc] init];
    [self.contentView addSubview:_source];
    _source.font = [UIFont systemFontOfSize:15];
    _source.textColor = [UIColor lightGrayColor];
    
    _replyCount = [[UILabel alloc] init];
    [self.contentView addSubview:_replyCount];
    _replyCount.font = [UIFont systemFontOfSize:15];
    _replyCount.textColor = [UIColor lightGrayColor];
    
    //2. 自动布局
    
    [_newsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [_newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newsTitle.mas_bottom).offset(10);
        make.left.right.equalTo(_newsTitle);
        make.height.mas_equalTo(90);
    }];
    
    [_source mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newsImage.mas_bottom).offset(10);
        make.left.equalTo(_newsImage);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [_replyCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_source);
        make.top.equalTo(_source);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (void) setModel:(WYNewsModel *)model {
    _model = model;
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:_model.imgsrc]];
    _newsTitle.text = _model.title;
    _source.text = _model.source;
    _replyCount.text = _model.replyCount;
    
}

@end
