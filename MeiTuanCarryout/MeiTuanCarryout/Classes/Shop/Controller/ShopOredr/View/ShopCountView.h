//
//  ShopCountView.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopFoodModel.h"
@class ShopCountView;

@protocol ShopCountViewDelegate <NSObject>

@optional

-(void)shopCountViewDelegateClickButton:(ShopCountView *)shopCountView;

@end

typedef enum : NSUInteger {
    ShopCountViewButtonTypeAdd,
    ShopCountViewButtonTypeSub,
    
} ShopCountViewButtonType;

@interface ShopCountView : UIView

@property (nonatomic, strong) ShopFoodModel *model;

@property (nonatomic, assign) ShopCountViewButtonType buttonType;

@property (nonatomic, weak) id<ShopCountViewDelegate> delegate;

+(instancetype)shopCountView;

@end
