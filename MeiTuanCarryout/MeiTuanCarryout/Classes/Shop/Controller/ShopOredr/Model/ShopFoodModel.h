//
//  ShopFoodModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopFoodModel : NSObject

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, assign) float min_price;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *description1;

@property (nonatomic, copy) NSString *month_saled_content;

@property (nonatomic, copy) NSString *praise_content;

@property (nonatomic, assign) NSInteger counts;

@property (nonatomic, assign) CGFloat praise_num;

@property (nonatomic, assign) CGFloat tread_num;


+ (instancetype)shopFoodModelWithDict:(NSDictionary *)dict;


@end
