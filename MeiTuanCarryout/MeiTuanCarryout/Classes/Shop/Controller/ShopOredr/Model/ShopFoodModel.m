//
//  ShopFoodModel.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopFoodModel.h"

@implementation ShopFoodModel

+ (instancetype)shopFoodModelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
//属性名和关键字重名.在setvalue中拦截并赋值
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _description1 = value;
    }

}

@end
