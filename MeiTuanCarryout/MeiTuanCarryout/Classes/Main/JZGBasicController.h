//
//  JZGBasicController.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JZGNavigationBar;

@interface JZGBasicController : UIViewController
//导航条
@property (nonatomic, strong, readonly) JZGNavigationBar *navBar;
//模型
@property (nonatomic, strong, readonly) UINavigationItem *navItem;
//状态栏样式
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@end
