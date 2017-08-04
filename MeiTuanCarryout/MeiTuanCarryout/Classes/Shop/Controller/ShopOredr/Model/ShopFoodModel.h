//
//  ShopFoodModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopFoodModel : NSObject

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, assign) float min_price;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *description1;

@property (nonatomic, copy) NSString *month_saled_content;

@property (nonatomic, copy) NSString *praise_content;

@property (nonatomic, assign) NSInteger counts;


+ (instancetype)shopFoodModelWithDict:(NSDictionary *)dict;


@end
