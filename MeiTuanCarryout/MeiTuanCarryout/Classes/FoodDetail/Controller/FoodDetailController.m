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

@interface FoodDetailController ()<UICollectionViewDelegate , UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *foodDetailView;


@end

static NSString *foodDetailCellID = @"foodDetailCellID";

@implementation FoodDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
}

-(void)setupUI{
    
    FoodDetailFlowLayout *flowLayout = [[FoodDetailFlowLayout alloc]init];
    
    UICollectionView *foodDetailView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    [self.view addSubview:foodDetailView];
    
    [foodDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    foodDetailView.delegate = self;
    foodDetailView.dataSource = self;
    
    [foodDetailView registerNib:[UINib nibWithNibName:@"FoodDetailCell" bundle:nil] forCellWithReuseIdentifier:foodDetailCellID];
    
    foodDetailView.bounces = NO;
    
    foodDetailView.showsVerticalScrollIndicator = NO;
    foodDetailView.showsHorizontalScrollIndicator = NO;
    
    foodDetailView.pagingEnabled = YES;

    
    
    
    _foodDetailView = foodDetailView;
    
}

-(void)viewDidLayoutSubviews{
    
    if (_indexPath != nil) {
        [_foodDetailView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        
        _indexPath =nil;
    }
    
}



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
