//
//  JZGNavigationBar.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "JZGNavigationBar.h"
#import "Masonry.h"

@implementation JZGNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    //将导航栏变成透明
    self.shadowImage = [UIImage new];
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //添加图片
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //赋值
    _imageView = imageView;
    
}
@end
