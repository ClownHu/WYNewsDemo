//
//  WYChannelView.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYChannelModel.h"

@protocol WYChannelViewDelegate <NSObject>


/**
 点击label ，跳转到对应的频道列表
 @param index 对应的频道的index
 */
-(void) channelChanged:(NSInteger) index;

@end


@interface WYChannelView : UIScrollView

//频道的模型数组
@property (nonatomic ,strong) NSArray *channelModelArray;


/**
 处理label点击的代理
 */
@property (nonatomic,weak) id <WYChannelViewDelegate> channelDelagate;


/**
 当前选中的label的index
 */
@property (nonatomic,assign) NSInteger selectedIndex;

@end
