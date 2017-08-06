//
//  ShopFoodViewCell.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopCountView;
@class ShopFoodModel;

@interface ShopFoodViewCell : UITableViewCell
//创建属性接受模型
@property (nonatomic, strong) ShopFoodModel *model;

//计数器视图
@property (nonatomic, weak) ShopCountView *countView;

@end
