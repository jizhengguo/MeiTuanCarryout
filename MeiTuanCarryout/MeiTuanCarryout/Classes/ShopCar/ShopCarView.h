//
//  ShopCarView.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/6.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopCarModel;

@interface ShopCarView : UIView

//创建模型属性
@property (nonatomic, strong) NSArray<ShopCarModel *> *shopCarModel;

@end
