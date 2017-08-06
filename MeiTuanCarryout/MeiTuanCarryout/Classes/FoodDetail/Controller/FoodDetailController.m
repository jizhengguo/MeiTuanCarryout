//
//  FoodDetailController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "FoodDetailController.h"
#import "FoodDetailFlowLayout.h"
#import "Masonry.h"
#import "ShopOrderModel.h"
#import "FoodDetailCell.h"
#import "JZGNavigationBar.h"
#import "ShopCarView.h"



@interface FoodDetailController ()<UICollectionViewDelegate , UICollectionViewDataSource>
//食物详情视图
@property (nonatomic, weak) UICollectionView *foodDetailView;


@end

static NSString *foodDetailCellID = @"foodDetailCellID";

@implementation FoodDetailController

- (void)viewDidLoad {
    [self setupUI];
    [super viewDidLoad];
    //设置隐藏navbar
    self.navBar.imageView.alpha = 0;
    self.navBar.tintColor = [UIColor whiteColor];
    self.statusBarStyle = UIStatusBarStyleLightContent;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}

-(void)setupUI{
    //创建食物详情
    FoodDetailFlowLayout *flowLayout = [[FoodDetailFlowLayout alloc]init];
    
    UICollectionView *foodDetailView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    [self.view addSubview:foodDetailView];
    
    [foodDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //设置代理
    foodDetailView.delegate = self;
    foodDetailView.dataSource = self;
    
    [foodDetailView registerNib:[UINib nibWithNibName:@"FoodDetailCell" bundle:nil] forCellWithReuseIdentifier:foodDetailCellID];
    //关闭弹簧
    foodDetailView.bounces = NO;
    //隐藏滚动条
    foodDetailView.showsVerticalScrollIndicator = NO;
    foodDetailView.showsHorizontalScrollIndicator = NO;
    //设置分页
    foodDetailView.pagingEnabled = YES;
    
    
    _foodDetailView = foodDetailView;
    
    [self settingShopCarView];
    
}

-(void)settingShopCarView{
    
    
    ShopCarView *carView = [[ShopCarView alloc] init];
    
    [self.view addSubview:carView];
    
    [carView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.offset(0);
        make.height.offset(50);
    }];
    
    
    carView.shopCarModel = _shopCarModel;
}


-(void)viewDidLayoutSubviews{
    //打开时滚动
    if (_indexPath != nil) {
        [_foodDetailView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
        _indexPath =nil;
    }
    
}


#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _foodModel.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _foodModel[section].spus.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:foodDetailCellID forIndexPath:indexPath];
    
    cell.foodModel = _foodModel[indexPath.section].spus[indexPath.item];
    
    return cell;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
