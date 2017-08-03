//
//  ShopOrderHeaderView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopOrderHeaderView.h"

@implementation ShopOrderHeaderView

- (void)drawRect:(CGRect)rect {
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.textColor = [UIColor blackColor];
}


-(void)setHeaderText:(NSString *)headerText{
    _headerText = headerText;
    
    self.textLabel.text = headerText;
}


@end
