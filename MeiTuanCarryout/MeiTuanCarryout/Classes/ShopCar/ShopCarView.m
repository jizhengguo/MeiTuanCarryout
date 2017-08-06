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

@interface ShopCarView ()

@property (nonatomic, weak) UIButton *shopCarButton;

@property (nonatomic, weak) UIButton *pleaseAddButton;

@property (nonatomic, weak) UILabel *priceLabel;



@end

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
    
    
    //创建背景图片
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_shop_car"]];
    
    [self addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //创建小黄车
    
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
    
    shopCarButton.enabled = NO;
    
    _shopCarButton = shopCarButton;
    
    //创建请添加按钮
    
    UIButton *pleaseAddButton = [[UIButton alloc] init];
    
    [pleaseAddButton setTitle:@"结  账" forState:UIControlStateNormal]
    ;
    [pleaseAddButton setTitle:@"请添加" forState:UIControlStateDisabled];
    
    [pleaseAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    [pleaseAddButton setBackgroundColor:[UIColor lightGrayColor]];
    
    pleaseAddButton.enabled = NO;
    
    pleaseAddButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:pleaseAddButton];
    
    [pleaseAddButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.width.offset(100);
    }];
    
    _pleaseAddButton = pleaseAddButton;
    
    //创建价钱label
    
    UILabel *priceLabel = [UILabel makeLabelWithText:@"¥ 0" andTextFont:20 andTextColor:[UIColor redColor]];
    
    [self addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(shopCarButton.mas_right).offset(16);
        
        make.centerY.offset(0);
    }];
    
    _priceLabel = priceLabel;
    
}

-(void)setShopCarModel:(NSArray<ShopFoodModel *> *)shopCarModel{
    
    _shopCarModel = shopCarModel;
    
    if (shopCarModel.count != 0) {
        _shopCarButton.enabled = YES;
        
        _pleaseAddButton.enabled = YES;
        
        _pleaseAddButton.backgroundColor = [UIColor orangeColor];
        
        
    }else{
        _shopCarButton.enabled = NO;
        
        _pleaseAddButton.enabled = NO;
        
        _pleaseAddButton.backgroundColor = [UIColor lightGrayColor];
    }
    
   NSNumber *sumPrice =  [shopCarModel valueForKeyPath:@"@sum.min_price"];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %@",sumPrice];
    
}


@end
