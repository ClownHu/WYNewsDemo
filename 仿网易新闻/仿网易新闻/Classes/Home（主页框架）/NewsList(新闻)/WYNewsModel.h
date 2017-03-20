//
//  WYNewsModel.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsModel : NSObject


/**
 回复数
 */
@property(nonatomic,copy) NSString *replyCount;

/**
 是否是第一条
 */
@property (nonatomic, assign) BOOL hasHead;

/**
 文章的id
 */
@property (nonatomic, copy) NSString *docid;

/**
 文章的标题
 */
@property (nonatomic, copy) NSString *title;

/**
 新闻的url
 */
@property (nonatomic, copy) NSString *url;

/**
 新闻的来源
 */
@property (nonatomic, copy) NSString *source;

/**
 是否是大图
 */
@property (nonatomic, assign) BOOL imgType;

/**
 图片的地址
 */
@property (nonatomic, copy) NSString *imgsrc;

/**
 如是有多张图片, 装的是第一张后面的几张图片的字典
 */
@property (nonatomic, copy) NSArray *imgextra;


@end
