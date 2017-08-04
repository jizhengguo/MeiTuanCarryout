//
//  ShopCountView.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopFoodModel.h"

@interface ShopCountView : UIView

@property (nonatomic, strong) ShopFoodModel *model;

+(instancetype)shopCountView;

@end
