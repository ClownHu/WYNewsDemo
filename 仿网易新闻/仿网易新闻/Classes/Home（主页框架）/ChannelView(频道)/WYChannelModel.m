//
//  WYChannelModel.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYChannelModel.h"
#import "YYModel.h"


@implementation WYChannelModel



+(NSArray *)channelModelArr {
    
    //获取频道json的二进制数据
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil]];
    //（整体是一个字典）要将其解析
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //根据key值取到json数组
    NSArray *dictArr = dict[@"tList"];
    
    //字典数组转模型数组
    NSArray *modelArr = [NSArray yy_modelArrayWithClass:[WYChannelModel class] json:dictArr];
    
    //对于有返回值得API，声称是一个新的对象
   modelArr =  [modelArr sortedArrayUsingComparator:^NSComparisonResult(WYChannelModel *obj1, WYChannelModel *obj2) {
        
       return [obj1.tid compare:obj2.tid];
    }];
    
    
    
    return modelArr;
}

-(NSString *)description {
    
    return [self yy_modelDescription];
}

@end
