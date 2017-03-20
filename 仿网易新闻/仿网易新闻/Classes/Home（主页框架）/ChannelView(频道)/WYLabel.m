//
//  WYLabel.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYLabel.h"


#define BIGFONTSIZE 20
#define SMALLFONTSIZE 16

@implementation WYLabel

+(WYLabel *) labelWithModel:(WYChannelModel *) model {
    
    WYLabel *label = [[WYLabel alloc]init];
    //给label赋值
    label.text = model.tname;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:BIGFONTSIZE];
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    
    return label;
}


//重写setter方法
-(void) setIsSelsected:(BOOL)isSelsected {
    
    _isSelsected = isSelsected;
    
    //当不被选中时候，显示小字体
    if (_isSelsected == NO) {
        
        self.font = [UIFont systemFontOfSize:SMALLFONTSIZE];
        self.textColor = [UIColor blackColor];
        
    } else {
        
        self.font = [UIFont systemFontOfSize:BIGFONTSIZE];
        self.textColor = [UIColor redColor];
    }
}
@end
