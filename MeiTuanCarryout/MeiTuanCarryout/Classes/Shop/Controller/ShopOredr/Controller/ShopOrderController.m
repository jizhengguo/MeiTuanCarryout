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

@interface ShopOrderController ()<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic, weak) UITableView *cotegoryTabelView;


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
    
    [self settingCotegoryTabelView];
    
    [self settingShopFoodTabelView];
    
}

-(void)settingCotegoryTabelView{
    UITableView *cotegoryTabelView = [[UITableView alloc] init];
    
    [self.view addSubview:cotegoryTabelView];
    
    [cotegoryTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.offset(100);
    }];
    
    cotegoryTabelView.delegate = self;
    cotegoryTabelView.dataSource = self;
    
    cotegoryTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    cotegoryTabelView.rowHeight = 60;
    
    //注册
    [cotegoryTabelView registerClass:[ShopOrderCell class] forCellReuseIdentifier:shopOrderCellID];
    
    _cotegoryTabelView = cotegoryTabelView;
}

-(void)settingShopFoodTabelView{
    UITableView *foodTableView = [[UITableView alloc]init];
    
    [self.view addSubview:foodTableView];
    
    [foodTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.left.equalTo(_cotegoryTabelView.mas_right).offset(0);
        
    }];
    
    [foodTableView registerNib:[UINib nibWithNibName:@"ShopFoodViewCell" bundle:nil] forCellReuseIdentifier:shopFoodCellID];
    
    foodTableView.estimatedRowHeight = 150;
    //注册头部视图
    [foodTableView registerClass:[ShopOrderHeaderView class] forHeaderFooterViewReuseIdentifier:shopHeaderCellID];
    
    foodTableView.sectionHeaderHeight = 30;
    
    foodTableView.delegate = self;
    foodTableView.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _cotegoryTabelView) {
        return 1;
    }
    return _shopOrderModel.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _cotegoryTabelView) {
        return _shopOrderModel.count;
    }
    
    return _shopOrderModel[section].spus.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _cotegoryTabelView) {
        
        ShopOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:shopOrderCellID forIndexPath:indexPath];
        
        cell.textLabel.text = _shopOrderModel[indexPath.row].name;
        
        return cell;
    }
    
    ShopFoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shopFoodCellID forIndexPath:indexPath];
    
    cell.model = _shopOrderModel[indexPath.section].spus[indexPath.row];
    
//    ShopFoodModel *foodModel=_shopOrderModel[indexPath.section].spus[indexPath.row];
//    cell.textLabel.text = foodModel.name;
    return cell;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ShopOrderHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shopHeaderCellID];
    
    headerView.headerText = _shopOrderModel[section].name;
    
    return headerView;
}

//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (tableView ==_cotegoryTabelView) {
//        return nil;
//    }
//    return _shopOrderModel[section].name;
//}
@end
