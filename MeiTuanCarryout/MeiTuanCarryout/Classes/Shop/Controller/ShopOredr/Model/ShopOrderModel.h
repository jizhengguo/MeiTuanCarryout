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

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<ShopFoodModel *> *spus;

+ (instancetype)shopOrderModelWithDict:(NSDictionary *)dict;

@end
