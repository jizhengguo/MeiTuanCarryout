//
//  shopHeaderViewModel.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "shopHeaderViewModel.h"
#import "LoopViewModel.h"

@implementation shopHeaderViewModel
+ (instancetype)shopHeaderVIewModelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setDiscounts2:(NSArray *)discounts2{
   
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:discounts2.count];
    for (NSDictionary *dict in discounts2) {
        LoopViewModel *loopViewModel = [LoopViewModel loopViewModelWithDict:dict];
        [arrM addObject:loopViewModel];
    }
    _discounts2 = arrM;

}

-(void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key{
    
}

@end
