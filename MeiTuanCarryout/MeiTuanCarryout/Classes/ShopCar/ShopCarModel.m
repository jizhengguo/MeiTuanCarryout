//
//  ShopCarModel.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/6.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopCarModel.h"

@implementation ShopCarModel

-(NSMutableArray<ShopFoodModel *> *)shopFoodModel{
    if (_shopFoodModel == nil) {
        _shopFoodModel = [NSMutableArray array];
        
    }
    return _shopFoodModel;
}
@end
