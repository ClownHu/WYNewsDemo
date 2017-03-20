//
//  AppDelegate.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "AppDelegate.h"
#import "WYMainController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建window
    _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    //设置根控制器
    WYMainController *vc = [[WYMainController alloc]init];
    
//    UINavigationController *
    _window.rootViewController = vc;
    
    //成为主窗口并可视
    [_window makeKeyAndVisible];
    
    return YES;
}



@end
