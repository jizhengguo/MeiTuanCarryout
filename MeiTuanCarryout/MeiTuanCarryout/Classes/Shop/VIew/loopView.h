//
//  loopView.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoopViewModel.h"

@interface loopView : UIView

//小图标
@property (nonatomic, weak) UIImageView *iconView;
//滚动消息
@property (nonatomic, weak) UILabel *infoLabel;

@property (nonatomic, strong) LoopViewModel *loopViewModel;

@end
