//
//  WYChannelModel.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYChannelModel : NSObject


/**
 频道的名称
 */
@property(nonatomic,copy) NSString *tname;


/**
 频道的id
 */
@property(nonatomic,copy) NSString *tid;

/**
 从本地获取所有频道的模型数组
 */
+(NSArray *) channelModelArr;


@end
