//
//  LoopViewModel.h
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoopViewModel : NSObject
//小图标
@property (nonatomic, copy) NSString *icon_url;
//轮播消息
@property (nonatomic, copy) NSString *info;

+ (instancetype)loopViewModelWithDict:(NSDictionary *)dict;
@end
