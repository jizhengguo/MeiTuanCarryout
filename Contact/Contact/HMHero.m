//
//  HMHero.m
//  04-好友列表
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "HMHero.h"

@implementation HMHero
+ (instancetype)heroWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
