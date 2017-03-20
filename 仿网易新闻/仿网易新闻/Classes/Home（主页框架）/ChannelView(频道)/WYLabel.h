//
//  WYLabel.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYChannelModel.h"


@interface WYLabel : UILabel


/**
 便利构造器

 @param model 频道模型
 @return WYLabel的对象
 */
+(WYLabel *) labelWithModel:(WYChannelModel *) model;

@property( nonatomic,assign) BOOL isSelsected;

@end
