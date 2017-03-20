//
//  WYNetworkTool.h
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WYNetworkTool : AFHTTPSessionManager

+(instancetype) sharedTool;

/**
 网络中间层(封装)
 
 @param urlString url字符串
 @param method 请求方式
 @param parameters 请求参数的字典
 @param callBack 完成回调
 */
-(void) requestWith:(NSString *)urlString method:(NSString *)method parameters:(id)parameters callBack : (void (^)(id response)) callBack;

@end
