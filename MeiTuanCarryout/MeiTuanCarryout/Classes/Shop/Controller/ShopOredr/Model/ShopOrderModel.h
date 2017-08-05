//
//  ShopOrderModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShopFoodModel;

@interface ShopOrderModel : NSObject
//设置头像
@property (nonatomic, copy) NSString *icon;
//店名
@property (nonatomic, copy) NSString *name;
//模型属性
@property (nonatomic, strong) NSArray<ShopFoodModel *> *spus;

+ (instancetype)shopOrderModelWithDict:(NSDictionary *)dict;

@end
