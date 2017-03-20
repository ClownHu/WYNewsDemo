//
//  WYMainController.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYMainController.h"

@interface WYMainController ()

@end

@implementation WYMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控件
    [self addControllers];
}


-(void)addControllers {
    
    UIViewController *vc1 = [self controllerWithClassName:@"WYHomeController" andTitle:@"首页" andImageName:@"tabbar_icon_bar"];
    vc1.view.backgroundColor = [UIColor yellowColor];
    UIViewController *vc2 = [self controllerWithClassName:@"UIViewController" andTitle:@"阅读" andImageName:@"tabbar_icon_reader"];
    vc2.view.backgroundColor = [UIColor redColor];
    UIViewController *vc3 = [self controllerWithClassName:@"UIViewController" andTitle:@"视频" andImageName:@"tabbar_icon_media"];
    vc3.view.backgroundColor = [UIColor purpleColor];
    UIViewController *vc4 = [self controllerWithClassName:@"UIViewController" andTitle:@"话题" andImageName:@"tabbar_icon_found"];
    vc4.view.backgroundColor = [UIColor cyanColor];
    UIViewController *vc5 = [self controllerWithClassName:@"UIViewController" andTitle:@"我" andImageName:@"tabbar_icon_me"];
    vc5.view.backgroundColor = [UIColor lightGrayColor];
    self.viewControllers = @[vc1,vc2,vc3,vc4,vc5];
    
    //标签颜色
    self.tabBar.tintColor = [UIColor redColor];
    
}


//封装方法
-(UIViewController *)controllerWithClassName:(NSString *)clsName andTitle:(NSString *)title andImageName:(NSString *)imgName {
    
    Class class = NSClassFromString(clsName);
    //创建vc
    UIViewController *vc = [[class alloc]init];
    //标签标题
    vc.title = title;
    
    
    //设置子控制器的tabbarItem的图片和选中图片
    //正常图片
    NSString *name1 = [imgName stringByAppendingString:@"_normal"];
    UIImage *image1 = [[UIImage imageNamed:name1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //标签图片
    vc.tabBarItem.image = image1;
    
    //设置选中图片
    NSString *name2 = [imgName stringByAppendingString:@"_highlight"];
    UIImage *image2 = [[UIImage imageNamed:name2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //标签图片
    vc.tabBarItem.selectedImage = image2;
    
    
    //保证UINavigationController
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    return nav;
}


@end
