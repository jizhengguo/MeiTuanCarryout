//
//  ShopFoodModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopFoodModel : NSObject
//食物图片
@property (nonatomic, copy) NSString *picture;
//价钱
@property (nonatomic, assign) float min_price;
//店名
@property (nonatomic, copy) NSString *name;
//详情
@property (nonatomic, copy) NSString *description1;
//月售
@property (nonatomic, copy) NSString *month_saled_content;
//赞
@property (nonatomic, copy) NSString *praise_content;
//计数器数量
@property (nonatomic, assign) NSInteger counts;
//赞数
@property (nonatomic, assign) CGFloat praise_num;
//踩数
@property (nonatomic, assign) CGFloat tread_num;


+ (instancetype)shopFoodModelWithDict:(NSDictionary *)dict;


@end
