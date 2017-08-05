//
//  ShopOrderHeaderView.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
//组头的默认样式继承自UITableViewHeaderFooterView
@interface ShopOrderHeaderView : UITableViewHeaderFooterView
//接受组头数据
@property (nonatomic, strong) NSString *headerText;

@end
