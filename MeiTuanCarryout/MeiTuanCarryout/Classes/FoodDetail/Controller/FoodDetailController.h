//
//  FoodDetailController.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "JZGBasicController.h"
@class ShopOrderModel;
@class ShopCarView;
@class ShopFoodModel;

@interface FoodDetailController : JZGBasicController
//创建模型属性
@property (nonatomic, strong) NSArray <ShopOrderModel *>*foodModel;
//创建索引
@property (nonatomic, assign) NSIndexPath *indexPath;
//创建购物车model
@property (nonatomic, strong) NSMutableArray<ShopFoodModel *> *shopCarModel;



@end
