//
//  FoodDetailController.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "JZGBasicController.h"
@class ShopOrderModel;

@interface FoodDetailController : JZGBasicController

@property (nonatomic, strong) NSArray <ShopOrderModel *>*foodModel;

@property (nonatomic, assign) NSIndexPath *indexPath;

@end
