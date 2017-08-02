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

@property (nonatomic, strong) NSNumber *min_price;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *_description;

@property (nonatomic, copy) NSString *month_saled_content;

@property (nonatomic, copy) NSString *praise_content;


+ (instancetype)shopFoodModelWithDict:(NSDictionary *)dict;


@end
