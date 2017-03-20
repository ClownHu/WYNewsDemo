//
//  WYNetworkTool+News.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/20.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYNetworkTool+News.h"
#import <YYModel.h>
#import "WYNewsModel.h"


@implementation WYNetworkTool (News)

-(void) requestNewsList :(NSString *)tid callBack:(void(^)(NSArray *modelArr)) callBack {
    
    NSString *urlStr = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/%@/0-20.html", tid];
    
    [[WYNetworkTool sharedTool] requestWith:urlStr method:@"GET" parameters:nil callBack:^(id response) {
        
        //NSLog(@"%@", response);
        //判断服务器是否返回nil, 如果返回nil, 就直接回调, 告诉控制器请求失败;
        if (response != nil) {
            NSArray *dicArr = response[tid];
            NSArray *modelArry = [NSArray yy_modelArrayWithClass:[WYNewsModel class] json:dicArr];
            callBack(modelArry);
        } else {
            callBack(nil);
        }
        
    }];
}


-(void) requestNewsDetail:(NSString *)docId callBack :(void(^)(NSString *bodyString))callBack {
    
    //拼接新闻详细页的接口
    NSString *urlString = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",docId];
    
    //调用网络中间层的方法，发起新闻详细页数据的请求
    [[WYNetworkTool sharedTool] requestWith:urlString method:@"GET" parameters:nil callBack:^(id response) {
        
        //详细页数据的字典
        NSDictionary *bodyDict = response[docId];
        //详细页的正文的html字符串
        NSString *bodyStr = bodyDict[@"body"];
        //正文中所有图片信息的字典数组
        NSArray *imageArr = bodyDict[@"img"];
        //正文的样子，从本地加载
        NSString *css = [NSString stringWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"news.css" withExtension:nil ] encoding:NSUTF8StringEncoding error:NULL];
        
        //将所有的注释掉的 `<!--IMG#0-->` 格式的图片字符串,替换成hmtl中 img标签
        for (NSDictionary *img in imageArr) {
            NSString *imgHtml = [NSString stringWithFormat:@"<img src=%@>", img[@"src"]];
            bodyStr = [bodyStr stringByReplacingOccurrencesOfString:img[@"ref"] withString: imgHtml];
        }
        
        //将css与body的正文拼接成一个完整和html字符串
        NSString *html = [NSString stringWithFormat:@"%@%@", css, bodyStr];
        
        //回调, 将html传给控制器展示
        callBack(html);
    }];
}
@end
