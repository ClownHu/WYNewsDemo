//
//  WYNetworkTool+News.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYNetworkTool.h"

@interface WYNetworkTool (News)


/**
 获取网易新闻的列表数据

 @param tid 频道的id
 @param callBack 完成回调，将模型数组直接返回
 */
-(void) requestNewsList :(NSString *)tid callBack:(void(^)(NSArray *modelArr)) callBack;

/**
 获取网易新闻的详细页的数据
 
 @param docId 新闻的id
 @param callBack 完成回调, 将处理好的网易新闻的正文的html字符串返回
 */
-(void) requestNewsDetail:(NSString *)docId callBack :(void(^)(NSString *bodyString))callBack;


@end
