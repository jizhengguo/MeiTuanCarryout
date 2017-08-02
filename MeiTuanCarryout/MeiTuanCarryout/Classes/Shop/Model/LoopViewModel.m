//
//  LoopViewModel.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "LoopViewModel.h"

@implementation LoopViewModel

+ (instancetype)loopViewModelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
