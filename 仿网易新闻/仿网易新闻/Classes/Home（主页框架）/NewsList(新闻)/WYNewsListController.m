//
//  WYNewsListController.m
//  仿网易新闻
//
//  Created by 胡卓 on 2017/3/18.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "WYNewsListController.h"
#import "CZAdditions.h"
#import <Masonry.h>
#import "WYNetworkTool+News.h"
#import "WYNewsModel.h"
#import "WYNormalCell.h"
#import "WYHeadCell.h"
#import "WYBigCell.h"
#import "WYMutilCell.h"
#import "WYNewsDetailController.h"


static NSString *rid = @"newListCell";
static NSString *head = @"headCell";
static NSString *big = @"bigCell";
static NSString *mutil = @"mutilCell";

@interface WYNewsListController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *modelList;

@end

@implementation WYNewsListController

- (id) initWithIndex: (NSInteger) index channelModel: (WYChannelModel *) model {
    
    if (self = [super init]) {
        _index = index;
        _model = model;
       
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //调试代码
    //    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    //    label.font = [UIFont systemFontOfSize:20];
    //    label.textAlignment = NSTextAlignmentCenter;
    //    label.textColor = [UIColor blackColor];
    //    label.text = [NSString stringWithFormat:@"第%zd个  name:%@",_index,_model.tname];
    //    [self.view addSubview:label];
     _modelList = [NSMutableArray array];
    
    [self setupUI];
    
    [self loadData];
    
}

#pragma amrk - 获取网络数据
-(void) loadData {
    
    [[WYNetworkTool sharedTool] requestNewsList:_model.tid callBack:^(NSArray *modelArr) {
        
//        NSLog(@"%@",modelArr);
        [_modelList addObjectsFromArray:modelArr];
        [_tableView reloadData];
    }];
}



-(void) setupUI {
    
    //实例化
    _tableView  = [[UITableView alloc]init];
    [self.view addSubview:_tableView];
    
    //设置约束
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    //设置数据源和代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //行高
    _tableView.estimatedRowHeight = 200;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    //注册
    [_tableView registerClass:[WYNormalCell class] forCellReuseIdentifier:rid];
    [_tableView registerClass:[WYHeadCell class] forCellReuseIdentifier:head];
    [_tableView registerClass:[WYBigCell class] forCellReuseIdentifier:big];
    [_tableView registerClass:[WYMutilCell class] forCellReuseIdentifier:mutil];
}


#pragma mark -  实现TableView的数据源方法
//返回行数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _modelList.count;
}

//返回cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WYNewsModel *model = _modelList[indexPath.row];
    
    //头部数据
    if (model.hasHead) {
        
        WYHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:head forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
    //大图
    if (model.imgType) {
        
        WYBigCell *cell = [tableView dequeueReusableCellWithIdentifier:big forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
    //多张图片
    if (model.imgextra != nil) {
        
        WYMutilCell *cell = [tableView dequeueReusableCellWithIdentifier:mutil forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
    //正常cell
    WYNormalCell *cell = (WYNormalCell *)[tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
    cell.model = model;
    
//    cell.textLabel.text =  indexPath.description;
    return cell;
}



#pragma mark ---实现tableView的代理方法

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取点击到的新闻的model
    WYNewsModel *model = _modelList[indexPath.row];
    
    //创建新闻详细页
    WYNewsDetailController *vc = [[WYNewsDetailController alloc]init];
    
    //将model传给详细页
    vc.model = model;
    
    //push操作推出详细页
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end

