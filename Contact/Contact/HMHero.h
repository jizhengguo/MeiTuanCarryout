//
//  HMHero.h
//  04-好友列表
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHero : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) NSNumber *age;

+ (instancetype)heroWithDict:(NSDictionary *)dict;
@end
