//
//  WYNormalCell.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYNormalCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

#define MARGIN 10


@implementation WYNormalCell

//c重写初始化方法
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

//创建子控件
-(void) setupUI {
    
    //MARK:1.创建并添加子控件
    _newsImage = [[UIImageView alloc]init];
    [self.contentView addSubview:_newsImage];
    
    _newsTitle = [[UILabel alloc]init];
    [self.contentView addSubview:_newsTitle];
    _newsTitle.font = [UIFont systemFontOfSize:18];
    _newsTitle.textColor = [UIColor blackColor];
    _newsTitle.numberOfLines = 3;
    
    _source = [[UILabel alloc] init];
    [self.contentView addSubview:_source];
    _source.font = [UIFont systemFontOfSize:15];
    _source.textColor = [UIColor lightGrayColor];
    
    _replyCount = [[UILabel alloc] init];
    [self.contentView addSubview:_replyCount];
    _replyCount.font = [UIFont systemFontOfSize:15];
    _replyCount.textColor = [UIColor lightGrayColor];
    
    
    //MARK:2.添加约束
    [_newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(self.contentView).offset(MARGIN);
        make.bottom.equalTo(self.contentView).offset(-MARGIN);
        make.size.mas_offset(CGSizeMake(102, 76));
    }];
    
    [_newsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newsImage);
        make.left.equalTo(_newsImage.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [_source mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_newsImage);
        make.left.equalTo(_newsImage.mas_right).offset(10);
    }];
    
    [_replyCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_newsImage);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}


-(void) setModel:(WYNewsModel *)model {
    
    _model = model;
    //赋值
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:_model.imgsrc]];
    _newsTitle.text = _model.title;
    _source.text = _model.source;
    _replyCount.text = _model.replyCount;
    
}

@end
