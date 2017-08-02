//
//  shopHeaderViewModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopHeaderViewModel : NSObject

//背景图片
@property (nonatomic, copy) NSString *poi_back_pic_url;
//头像图片
@property (nonatomic, copy) NSString *pic_url;
//店铺名称
@property (nonatomic, strong) NSString *name;
//广告
@property (nonatomic, copy) NSString *bulletin;
//轮播广告
@property (nonatomic, strong) NSArray *discounts2;

+ (instancetype)shopHeaderVIewModelWithDict:(NSDictionary *)dict;

@end
