//
//  NSObject+LineFormula.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <UIKit/UIKit.h>

struct JZGValue {
    CGFloat result;
    CGFloat consult;
};
typedef struct JZGValue JZGValue;

CG_INLINE JZGValue
JZGValueMake(CGFloat result, CGFloat consult)
{
    JZGValue value;
    value.result = result;
    value.consult = consult;
    return value;

}

@interface NSObject (LineFormula)


-(CGFloat)lineFormulaResultAndVlaue1:(JZGValue)value1 AndVlaue2:(JZGValue)value2;

@end
