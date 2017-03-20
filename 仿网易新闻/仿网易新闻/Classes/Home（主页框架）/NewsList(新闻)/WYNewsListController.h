//
//  WYNewsListController.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYChannelModel.h"


@interface WYNewsListController : UIViewController

@property(nonatomic,assign) NSInteger index;

@property(nonatomic,strong) WYChannelModel *model;

//初始化方法

- (id) initWithIndex: (NSInteger) index channelModel: (WYChannelModel *) model;


@end
