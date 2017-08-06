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

@interface ShopCarView ()<CAAnimationDelegate>

@property (nonatomic, weak) UIButton *shopCarButton;

@property (nonatomic, weak) UIButton *pleaseAddButton;

@property (nonatomic, weak) UILabel *priceLabel;

@property (nonatomic, weak) UILabel *foodCountLabel;



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
    
    //食物数量label
    UILabel *foodCountLabel = [UILabel makeLabelWithText:@"" andTextFont:12 andTextColor:[UIColor whiteColor]];
    
    foodCountLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_food_count_bg"]];
    
    
    [self addSubview:foodCountLabel];
    
    [foodCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(shopCarButton);
        make.height.width.offset(16);
    }];
    
    // 设置label中的内容居中
    foodCountLabel.textAlignment = NSTextAlignmentCenter;
    // 让字体自适应
    foodCountLabel.adjustsFontSizeToFitWidth = YES;
    
    // 让基线居中
    foodCountLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    // 让它默认隐藏
    foodCountLabel.hidden = YES;
    
    _foodCountLabel = foodCountLabel;

    
    
    
}

-(void)setShopCarModel:(NSArray<ShopFoodModel *> *)shopCarModel{
    
    _shopCarModel = shopCarModel;
    
    if (shopCarModel.count != 0) {
        _shopCarButton.enabled = YES;
        
        _pleaseAddButton.enabled = YES;
        
        _pleaseAddButton.backgroundColor = [UIColor orangeColor];
        
        _foodCountLabel.hidden = NO;
        
        
    }else{
        _shopCarButton.enabled = NO;
        
        _pleaseAddButton.enabled = NO;
        
        _pleaseAddButton.backgroundColor = [UIColor lightGrayColor];
        
        _foodCountLabel.hidden = YES;
    }
    
   NSNumber *sumPrice =  [shopCarModel valueForKeyPath:@"@sum.min_price"];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %@",sumPrice];
    
    _foodCountLabel.text = @(shopCarModel.count).description;
    
}

-(void)animationWithStarPoint:(CGPoint)starPoint{
    UIImageView *redPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_common_point"]];
    [self addSubview:redPoint];
    
    CAKeyframeAnimation *anim = [[CAKeyframeAnimation alloc]init];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    CGPoint endPoint = _shopCarButton.center;
    
    [path moveToPoint:starPoint];
    
    [path addQuadCurveToPoint:endPoint controlPoint:CGPointMake(starPoint.x - 150, starPoint.y - 100)];
    
    anim.keyPath = @"position";
    
    anim.path = path.CGPath;
    
    anim.duration = 0.25;
    
    anim.repeatCount = 1;
    
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    anim.delegate = self;
    
    [anim setValue:redPoint forKey:@"redPoint"];
    
    [redPoint.layer addAnimation:anim forKey:nil];
    
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [UIView animateWithDuration:0.25 animations:^{
        
        [[anim valueForKey:@"redPoint"] removeFromSuperview];
        
        _shopCarButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            _shopCarButton.transform = CGAffineTransformIdentity;
        }];
    }];
}


@end
