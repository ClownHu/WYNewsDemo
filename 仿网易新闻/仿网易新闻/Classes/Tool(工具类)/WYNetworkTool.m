//
//  WYNetworkTool.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYNetworkTool.h"

@implementation WYNetworkTool

+(instancetype) sharedTool {
    
    static WYNetworkTool *tool = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        tool = [[WYNetworkTool alloc]initWithBaseURL:nil];
    });
    
    return tool;
}

-(void) requestWith:(NSString *)urlString
             method:(NSString *)method
         parameters:(NSDictionary *)parameters
          callBack : (void (^)(id response)) callBack {
    
    if ([method isEqualToString:@"GET"]) {
        
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            callBack(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            callBack(nil);
        }];
    }
    
    if ([method isEqualToString:@"POST"]) {
        
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            callBack(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            callBack(nil);
            NSLog(@"%@",error);
        }];
    }
}

@end
