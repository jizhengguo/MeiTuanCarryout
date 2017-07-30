//
//  NSObject+LineFormula.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "NSObject+LineFormula.h"

@implementation NSObject (LineFormula)



-(CGFloat)lineFormulaResultAndVlaue1:(JZGValue)value1 AndVlaue2:(JZGValue)value2{
    CGFloat a = (value1.result - value2.result)/(value1.consult - value2.consult);
    CGFloat b = value1.result - value1.consult * a;
    
    return a *[(NSNumber *)self floatValue] + b;
}

@end
