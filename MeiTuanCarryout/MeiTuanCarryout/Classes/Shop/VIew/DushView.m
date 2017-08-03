//
//  DushView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "DushView.h"

@implementation DushView

-(void)drawRect:(CGRect)rect{
    //开启上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置初始点
    CGContextMoveToPoint(ctx,0, 1);
    //设置结束点
    CGContextAddLineToPoint(ctx,self.bounds.size.width,  1);
    //设置为虚线
    CGFloat lengths[] = {2,2};
    CGContextSetLineDash(ctx, 0, lengths, 2);
    
    CGContextSetLineWidth(ctx, 10);
    //设置虚线颜色
    [[UIColor whiteColor] set];
    
    //渲染
    CGContextStrokePath(ctx);
    
}

@end
