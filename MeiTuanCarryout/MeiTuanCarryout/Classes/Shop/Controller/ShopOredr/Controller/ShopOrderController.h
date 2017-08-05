//
//  ShopOrderController.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/31.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopOrderModel;


@interface ShopOrderController : UIViewController

//创建模型属性接收数据
@property (nonatomic, strong) NSArray<ShopOrderModel *> *shopOrderModel;



@end
