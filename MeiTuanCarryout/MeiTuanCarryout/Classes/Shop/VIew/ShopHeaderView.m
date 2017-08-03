//
//  ShopHeaderView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopHeaderView.h"
#import "Masonry.h"
#import "UILabel+Addition.h"
#import "UIImageView+WebCache.h"
#import "shopHeaderViewModel.h"
#import "LoopViewModel.h"
#import "loopView.h"
#import "DushView.h"
#import "ShopDetailViewController.h"
#import "UIView+Addition.h"
#import "ShopDetailAnimation.h"

@interface ShopHeaderView ()
//背景图片
@property (nonatomic, weak) UIImageView *backGroundImage;

//滚动视图
@property (nonatomic, weak) loopView *loopView;

//头像视图
@property (nonatomic, weak) UIImageView *avadarView;

//店名label
@property (nonatomic, weak) UILabel *nameLabel;

//广告label
@property (nonatomic, weak) UILabel *bulletinLabel;

//索引
@property (nonatomic, assign) NSInteger index;

//设置一个专场动画代理,必须强引用
@property (nonatomic, strong) ShopDetailAnimation *anmination;

@end

@implementation ShopHeaderView

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
    UIImageView *backGroundImage = [[UIImageView alloc]init];
    
    [self addSubview:backGroundImage];
    
    [backGroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    _backGroundImage = backGroundImage;
    
    //从下向上布局,创建滚动条
    
    loopView *shopLoopView = [[loopView alloc]init];
//    shopLoopView.backgroundColor = [UIColor redColor];
    [self addSubview:shopLoopView];
    //添加约束
    [shopLoopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-8);
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(20);
    }];
    
    UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_white"]];
    
    [shopLoopView addSubview:arrowView];
    
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.offset(0);
    }];

    
    _loopView = shopLoopView;
    
    //创建一个虚线View
    DushView *dushView = [[DushView alloc] init];
    
    [self addSubview:dushView];
    
    [dushView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.left.offset(16);
        make.bottom.equalTo(shopLoopView.mas_top).offset(-8);
        make.height.offset(1);
    }];
    dushView.backgroundColor = [UIColor clearColor];
    
    //创建头像
    UIImageView *avadarView = [[UIImageView alloc]init];
//    avadarView.backgroundColor = [UIColor yellowColor];
    [self addSubview:avadarView];
    //切圆角
    avadarView.layer.cornerRadius = 32;
    avadarView.clipsToBounds = YES;
    //设置边框
    avadarView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    avadarView.layer.borderWidth = 2;
    //设置填充模式
    avadarView.contentMode = UIViewContentModeScaleAspectFill;
    //添加约束
    [avadarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(shopLoopView.mas_top).offset(-16);
        make.left.equalTo(shopLoopView).offset(0);
        make.width.height.offset(64);
    }];
    
    _avadarView = avadarView;
    
    //设置名称label
    UILabel *nameLabel = [UILabel makeLabelWithText:@"详情" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avadarView.mas_right).offset(16);
        make.centerY.equalTo(avadarView).offset(-16);
    }];
    
    _nameLabel = nameLabel;
    
    //设置广告label
    UILabel *bulletinLabel = [UILabel makeLabelWithText:@"广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告" andTextFont:14 andTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    
    [self addSubview:bulletinLabel];
    
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.centerY.equalTo(avadarView).offset(16);
        make.right.offset(-16);
    }];
    
    _bulletinLabel = bulletinLabel;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(animation) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    
    [_loopView addGestureRecognizer:tap];
    
}

-(void)animation{
    //设置转场动画
    [UIView transitionWithView:_loopView duration:0.25 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
        
        _index = (_index + 7) % 7;
        
        NSURL *url = [NSURL URLWithString:_model.discounts2[_index].icon_url];
        [_loopView.iconView sd_setImageWithURL:url];
        
        _loopView.infoLabel.text = _model.discounts2[_index].info;
        
        _index++;
        
    } completion:nil];
    
    
    
}


-(void)tapGesture:(UITapGestureRecognizer *)tap{
    
    ShopDetailViewController *foodDetail = [[ShopDetailViewController alloc] init];
    
    
    foodDetail.shopPOIInfoModel = _model;
    foodDetail.view.backgroundColor = [UIColor orangeColor];
    
    foodDetail.modalPresentationStyle = UIModalPresentationCustom;
    
    _anmination = [[ShopDetailAnimation alloc] init];
    
    foodDetail.transitioningDelegate = _anmination;
    
    [self.viewControler presentViewController:foodDetail animated:YES completion:nil];
    
}

-(void)setModel:(shopHeaderViewModel *)model{
    
    _model = model;
    //背景图片
    NSString *backImageStr = [model.poi_back_pic_url stringByDeletingPathExtension];
    [ _backGroundImage sd_setImageWithURL:[NSURL URLWithString:backImageStr]];
    
    //头像视图
    NSString *avadarStr = [model.pic_url stringByDeletingPathExtension];
    [_avadarView sd_setImageWithURL:[NSURL URLWithString:avadarStr]];
    
    //店名label
    _nameLabel.text = model.name;
    
    //广告label
    _bulletinLabel.text = model.bulletin;
    
//    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:model.discounts2.count];
//    for (NSDictionary *dict in model.discounts2) {
//        LoopViewModel *loopViewModel = [LoopViewModel loopViewModelWithDict:dict];
//        [arrM addObject:loopViewModel];
//    }
    _loopView.loopViewModel = model.discounts2[0];
    
    
}



@end
