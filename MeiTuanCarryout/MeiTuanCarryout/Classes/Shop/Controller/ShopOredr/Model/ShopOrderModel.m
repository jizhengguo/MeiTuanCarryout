//
//  ShopOrderModel.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopOrderModel.h"
#import "ShopFoodModel.h"

@implementation ShopOrderModel

+ (instancetype)shopOrderModelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"spus"]) {
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:_spus.count];
        for (NSDictionary *dict in _spus) {
            ShopFoodModel *foodModel = [ShopFoodModel shopFoodModelWithDict:dict];
            
            [arrM addObject:foodModel];
            
        }
        
        _spus = arrM;
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
