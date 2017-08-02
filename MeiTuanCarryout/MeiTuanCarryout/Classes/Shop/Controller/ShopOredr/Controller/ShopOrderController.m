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

@interface ShopOrderController ()<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic, weak) UITableView *cotegoryTabelView;


@end

static NSString *shopOrderCellID = @"shopOrderCellID";
static NSString *shopFoodCellID = @"shopFoodCellID";

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
    
    //注册
    [cotegoryTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:shopOrderCellID];
    
    _cotegoryTabelView = cotegoryTabelView;
}

-(void)settingShopFoodTabelView{
    UITableView *foodTableView = [[UITableView alloc]init];
    
    [self.view addSubview:foodTableView];
    
    [foodTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.left.equalTo(_cotegoryTabelView.mas_right).offset(0);
        
    }];
    
    [foodTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:shopFoodCellID];
    
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shopOrderCellID forIndexPath:indexPath];
        
        cell.textLabel.text = _shopOrderModel[indexPath.row].name;
        
        return cell;
    }
    return nil;
    
}
@end
