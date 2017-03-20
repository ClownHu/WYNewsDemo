//
//  WYHomeController.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYHomeController.h"
#import "Masonry.h"
#import "WYNewsListController.h"
#import "WYChannelView.h"

@interface WYHomeController () <UIPageViewControllerDataSource,UIPageViewControllerDelegate,WYChannelViewDelegate> {
    WYChannelView *channelView;
    
    UIPageViewController *pageVC;
    
}

@end

@implementation WYHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //添加频道视图
    [self addChannelView];
    
    [self setPageViewController];
}

#pragma mark - -切换频道delegate
-(void)channelChanged:(NSInteger)index {
    
    NSLog(@"切换到频道：%ld",index);
    
    //MARK:1.获取当前子控制器的index
    WYNewsListController *newsVC = pageVC.viewControllers[0];
    NSInteger currentIndex = newsVC.index;
    
    //MARK:2.如果当前的index和被点击的index一致，什么都不用做
    if (currentIndex == index) {
        
        return;
    }
    
    //MARK:3.如果点击的index较大，右往左推，index较小，左往右推
    NSInteger direction = index > currentIndex ? UIPageViewControllerNavigationDirectionForward :UIPageViewControllerNavigationDirectionReverse;
    
    //MARK:4.创建将要显示的子控制器
    WYNewsListController *vc = [[WYNewsListController alloc] initWithIndex:index channelModel:channelView.channelModelArray[index]];
    
    
    NSArray *vcArray = @[vc];
    
    
    //MARK:5.重新设置pageVC的子控制器，每次调用setViewControllers 方法时，子控制器都会被推一次
    [pageVC setViewControllers:vcArray direction:direction animated:YES completion:nil];
}

-(void) addChannelView {
    //初始化
    channelView = [[WYChannelView alloc]init];
    //设置代理
    channelView.channelDelagate = self;
    
    [self.view addSubview:channelView];
    
    //设置约束
    [channelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        make.height.mas_offset(40);
    }];
    
    
}

/**
 设置左右滑的新闻列表页的PageViewController
 */
-(void) setPageViewController {
    
    //MARK:1.创建一个UIPageViewController
    pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey: @0}];
    
    //MARK:2.将PageViewController添加到根控制器
    [self addChildViewController:pageVC];
    [self.view addSubview:pageVC.view];
    [pageVC didMoveToParentViewController:self];
    
    //调整PageViewController的布局（设置约束）
    [pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.equalTo(self.view);
        make.top.equalTo(channelView.mas_bottom);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    //MARK:3.添加子控制器（一开始只需要添加一个）
    WYNewsListController *newsVC = [[WYNewsListController alloc]init];
    NSArray *vcArray = @[newsVC];
    
    [pageVC setViewControllers:vcArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
    //实现数据源
    pageVC.dataSource = self;
    pageVC.delegate = self;
}


#pragma mark - 实现PageViewController的代理方法

/**
 PageViewController的子控制器将要滑动的时候调用
 
 @param pageViewController 当前的PageViewController
 @param pendingViewControllers 将要跳转到的子控制器
 */
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<WYNewsListController *> *)pendingViewControllers NS_AVAILABLE_IOS(6_0) {
    
    //获取将要跳转的子控制器
    WYNewsListController *vc = pendingViewControllers[0];
    channelView.selectedIndex = vc.index;
    
}

/**
 PageViewController的子控制器滑动结束的时候调用
 
 @param pageViewController  当前的PageViewController
 @param finished 动画是否结束
 @param previousViewControllers 从哪个字控制器划过来的 （里面装的是上一个子控制器）
 @param completed 是否结束
 */
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    //获取当前的子控制器的index
    WYNewsListController *vc = (WYNewsListController*)pageViewController.viewControllers[0];
    channelView.selectedIndex = vc.index;
}

#pragma mark - PageViewController的数据源方法

/**
 生成前一个控制器
 @param pageViewController 当前的pageViewController
 @param viewController 当前屏幕上展示的子控制器
 @return 生成并返回前一个控制器
 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(WYNewsListController *)viewController {
    
    //到头了
    if (viewController.index == 0) {
        
        return nil;
    }
    
    NSInteger index = viewController.index -1;
    
    WYNewsListController *vc = [[WYNewsListController alloc]initWithIndex:index channelModel:channelView.channelModelArray[index]];
    return vc;
}

/**
 生成前一个控制器
 @param pageViewController 当前的pageViewController
 @param viewController 当前屏幕上展示的子控制器
 @return 生成并返回前一个控制器
 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(WYNewsListController *)viewController {
    
    //到头了
    if (viewController.index == channelView.channelModelArray.count -1) {
        
        return nil;
    }
    
    NSInteger index = viewController.index +1;
    WYNewsListController *vc = [[WYNewsListController alloc]initWithIndex:index channelModel:channelView.channelModelArray[index]];
    return vc;
}
@end
