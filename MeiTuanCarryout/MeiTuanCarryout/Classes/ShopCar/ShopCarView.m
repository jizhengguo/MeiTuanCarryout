//
//  ShopCarView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/6.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopCarView.h"
#import "Masonry.h"
#import "UILabel+Addition.h"

@implementation ShopCarView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //创建小黄车
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *shopCarButton = [[UIButton alloc] init];
    
    [shopCarButton setImage:[UIImage imageNamed:@"button_shoppingCart_noEmpty"] forState:UIControlStateNormal];
    
    [shopCarButton setImage:[UIImage imageNamed:@"button_shoppingCart_noEmpty"] forState:UIControlStateSelected];
    
    [shopCarButton setImage:[UIImage imageNamed:@"button_shoppingCart_empty"] forState:UIControlStateDisabled];
    
    [self addSubview:shopCarButton];
    
    [shopCarButton sizeToFit];
    
    [shopCarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.bottom.offset(-13);
        
    }];
    
    //创建请添加按钮
    
    UIButton *pleaseAddButton = [[UIButton alloc] init];
    
    [pleaseAddButton setTitle:@"请添加" forState:UIControlStateNormal];
    
    [pleaseAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [pleaseAddButton setBackgroundColor:[UIColor lightGrayColor]];
    
    pleaseAddButton.userInteractionEnabled = NO;
    
    pleaseAddButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:pleaseAddButton];
    
    [pleaseAddButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.width.offset(100);
    }];
    
    //创建价钱label
    
    UILabel *priceLabel = [UILabel makeLabelWithText:@"¥ 0" andTextFont:20 andTextColor:[UIColor redColor]];
    
    [self addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(shopCarButton.mas_right).offset(16);
        
        make.centerY.offset(0);
    }];
    
    
}


@end
