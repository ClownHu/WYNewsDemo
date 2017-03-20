//
//  WYChannelView.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYChannelView.h"
#import "CZAdditions.h"
#import "WYLabel.h"

#define BASETAG 666

@implementation WYChannelView

//初始化方法
-(instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //调用模型的类方法，获取模型数组
      _channelModelArray = [WYChannelModel channelModelArr];
        
        //设置UI，添加所有频道的label
        [self setupUI];
        
    }
    return self;
}

-(void) setupUI {
    
    //隐藏滚动条（水平方向）
    self.showsHorizontalScrollIndicator = NO;
    
    //label的边距
    CGFloat margin = 0;
    
    //label的下标
    NSInteger index = 0;
    
    //遍历模型数组，添加label
    for (WYChannelModel *model in _channelModelArray) {
        
        //用WYLabel的遍历构造器创建label
        WYLabel *label = [WYLabel labelWithModel:model];
        //(设置frame)生成label的frame
        CGRect frame = CGRectMake(margin, 0, label.bounds.size.width, 40);
        label.frame = frame;
        
        //每创建一个label，margin的值修改为下一个被创建的label的margin
        margin += label.bounds.size.width;
        
        //添加到视图
        [self addSubview:label];
        
        //默认是不选中的
        label.isSelsected = NO;
        
        //给label设置一个tag（所有view的默认的tag是0，添加BASETAG 防止有多个子视图tag都为0时，取错对象）
        label.tag = BASETAG +index;
        
        //给label添加点击事件
        //默认是关闭的,需要手动开启
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeSelectIndex:)];
     
        //label添加手势
        [label addGestureRecognizer:tap];
        
        //每循环一次让index +1
        index += 1;
    }
    
    //将第0个label设置为高亮
    self.selectedIndex = 0;
    
    //调整scrollView的contentsize
    self.contentSize = CGSizeMake(margin, 40);
}



/**
 改变选中的label
 */
-(void) changeSelectIndex:(UITapGestureRecognizer *)tap {
    
    //获取到被点击的label及index
    WYLabel *label = (WYLabel*)tap.view;
    NSInteger index = label.tag - BASETAG;
    
    //设置当前选中的index 重写selectedIndex 的setter方法，当改变 selectedIndex值得时候，可以同时改变对应的label的状态
    [self setSelectedIndex:index];
    
    
    //让代理切换频道
    if (_channelDelagate != nil && [_channelDelagate respondsToSelector:@selector(channelChanged:)]) {
        
        
        [_channelDelagate channelChanged:index];
    }
    
}


#pragma mark - setSelectedIndex 的重写方法
-(void)setSelectedIndex:(NSInteger)selectedIndex {
    
    //_setSelectedIndex对应的label应该取消选中状态
    WYLabel *selectedLabel = [self viewWithTag:_selectedIndex + BASETAG];
    selectedLabel.isSelsected = NO;
    
    //selectedIndex对应的label应该为选中状态
    WYLabel *shouldSelectLabel = [self viewWithTag:selectedIndex +BASETAG];
    shouldSelectLabel.isSelsected = YES;
    
    //如果是点击的将要被高亮的label超过屏幕，则将其滚动到屏幕的可视区域
    CGFloat originX = shouldSelectLabel.frame.origin.x;
    
    CGFloat rightX = shouldSelectLabel.frame.origin.x +shouldSelectLabel.bounds.size.width;
    
    
    
    //数学逻辑
    if (originX < self.contentOffset.x || rightX > self.contentOffset.x) {
        
        [self scrollRectToVisible:shouldSelectLabel.frame animated:YES];
    }
    
    //记录
    _selectedIndex = selectedIndex;
}
@end
