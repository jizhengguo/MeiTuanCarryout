//
//  ShopCarModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/6.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShopFoodModel;

@interface ShopCarModel : NSObject
//保存模型
@property (nonatomic, strong) NSMutableArray<ShopFoodModel *> *shopFoodModel;

@end
