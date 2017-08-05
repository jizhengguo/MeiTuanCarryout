//
//  ShopOrderHeaderView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopOrderHeaderView.h"

@implementation ShopOrderHeaderView
//设置字体,绘图或布局完成时修改
- (void)drawRect:(CGRect)rect {
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.textColor = [UIColor blackColor];
}

//给组头赋值
-(void)setHeaderText:(NSString *)headerText{
    _headerText = headerText;
    
    self.textLabel.text = headerText;
}


@end
