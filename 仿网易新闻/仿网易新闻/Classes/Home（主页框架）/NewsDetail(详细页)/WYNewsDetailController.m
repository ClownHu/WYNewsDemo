//
//  WYNewsDetailController.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYNewsDetailController.h"
#import "WYNetworkTool.h"
#import "WYNetworkTool+News.h"

@interface WYNewsDetailController ()

@property (nonatomic,strong) UIWebView *webView;


@end

@implementation WYNewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //实例化
    _webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _webView.backgroundColor = [UIColor whiteColor];
    
    //设置webView的滚动速度
    _webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    [self.view addSubview:_webView];
    
    //获取并加载详细页数据
    [self loadData];
    
}


-(void) loadData {
    
    [[WYNetworkTool sharedTool] requestNewsDetail:_model.docid callBack:^(NSString *bodyString) {
        
        //加载html字符串
        [_webView loadHTMLString:bodyString baseURL:nil];
    }];
    
    
    
}


@end
