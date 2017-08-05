//
//  ShopOrderController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/31.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopOrderController.h"
#import "Masonry.h"
#import "ShopOrderModel.h"
#import "ShopFoodModel.h"
#import "ShopOrderCell.h"
#import "ShopFoodViewCell.h"
#import "ShopOrderHeaderView.h"
#import "FoodDetailController.h"

@interface ShopOrderController ()<UITableViewDataSource , UITableViewDelegate>
//标题视图
@property (nonatomic, weak) UITableView *cotegoryTabelView;
//食物视图
@property (nonatomic, weak) UITableView *foodTableView;

//创建bool属性记录点击的是否为标题视图
@property (nonatomic, assign) BOOL cotegoryIsClick;



@end

static NSString *shopOrderCellID = @"shopOrderCellID";
static NSString *shopFoodCellID = @"shopFoodCellID";
static NSString *shopHeaderCellID = @"shopHeaderCellID";

@implementation ShopOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupUI];
}

-(void)setupUI{
    //创建标题视图
    [self settingCotegoryTabelView];
    //创建视图视图
    [self settingShopFoodTabelView];
    
}
#pragma mark - 创建标题视图
-(void)settingCotegoryTabelView{
    UITableView *cotegoryTabelView = [[UITableView alloc] init];
    
    [self.view addSubview:cotegoryTabelView];
    
    [cotegoryTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.offset(100);
    }];
    //设置代理
    cotegoryTabelView.delegate = self;
    cotegoryTabelView.dataSource = self;
    //隐藏分割线
    cotegoryTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置行高
    cotegoryTabelView.rowHeight = 60;
    
    //注册
    [cotegoryTabelView registerClass:[ShopOrderCell class] forCellReuseIdentifier:shopOrderCellID];
    //赋值
    _cotegoryTabelView = cotegoryTabelView;
}
#pragma mark - 创建食物视图
-(void)settingShopFoodTabelView{
    UITableView *foodTableView = [[UITableView alloc]init];
    
    [self.view addSubview:foodTableView];
    
    [foodTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.left.equalTo(_cotegoryTabelView.mas_right).offset(0);
        
    }];
    //用Xib床架tableView
    [foodTableView registerNib:[UINib nibWithNibName:@"ShopFoodViewCell" bundle:nil] forCellReuseIdentifier:shopFoodCellID];
    //设置预估行高计算尺寸
    foodTableView.estimatedRowHeight = 150;
    //注册头部视图
    [foodTableView registerClass:[ShopOrderHeaderView class] forHeaderFooterViewReuseIdentifier:shopHeaderCellID];
    //设置组头高度
    foodTableView.sectionHeaderHeight = 30;
    //设置代理
    foodTableView.delegate = self;
    foodTableView.dataSource = self;
    //赋值
    _foodTableView = foodTableView;
}

//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //判断所在的tableview是哪个视图中的
    if (tableView == _cotegoryTabelView) {
        return 1;
    }
    return _shopOrderModel.count;
    
}
//返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _cotegoryTabelView) {
        return _shopOrderModel.count;
    }
    
    return _shopOrderModel[section].spus.count;
}

//为cell进行创建和赋值

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //如果是标题视图则用系统样式
    if (tableView == _cotegoryTabelView) {
        
        ShopOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:shopOrderCellID forIndexPath:indexPath];
        
        cell.textLabel.text = _shopOrderModel[indexPath.row].name;
        
        return cell;
    }
    //如果不是,则为自定义cell
    ShopFoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shopFoodCellID forIndexPath:indexPath];
    
    cell.model = _shopOrderModel[indexPath.section].spus[indexPath.row];
    
//    ShopFoodModel *foodModel=_shopOrderModel[indexPath.section].spus[indexPath.row];
//    cell.textLabel.text = foodModel.name;
    return cell;
    
}
//设置组头,自定义组头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //创建
    ShopOrderHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shopHeaderCellID];
    //给组头视图赋值
    headerView.headerText = _shopOrderModel[section].name;
    
    return headerView;
}

//设置选中状态
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //如果选中的为标题视图
    if (tableView == _cotegoryTabelView) {
        //将选中属性设置为yes
        _cotegoryIsClick = YES;
        //将食物视图滚动到指定组的第0行
        [_foodTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        return;
    }
    //如果选中的是食物视图
    if (tableView == _foodTableView) {
        //立即取消选中
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //创建详情控制器
        FoodDetailController *foodDetailVC = [[FoodDetailController alloc] init];
        //赋值模型属性
        foodDetailVC.foodModel =_shopOrderModel;
        //赋值索引
        foodDetailVC.indexPath = indexPath;
        //push出行的页面
        [self.navigationController pushViewController:foodDetailVC animated:YES];
    }
}

//设置滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //当滚动视图为food视图时
    if (scrollView == _foodTableView) {
        //如果详情视图点击状态为yes则返回
        if(_cotegoryIsClick == YES) return;
        //将想起视图的选中状态设置为第0组的组数行
        NSIndexPath *indexPath = _foodTableView.indexPathsForVisibleRows[0];
        [_cotegoryTabelView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
}

//滚动动画完成时将选中状态设置为no
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    _cotegoryIsClick = NO;
    
}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (tableView ==_cotegoryTabelView) {
//        return nil;
//    }
//    return _shopOrderModel[section].name;
//}
@end
