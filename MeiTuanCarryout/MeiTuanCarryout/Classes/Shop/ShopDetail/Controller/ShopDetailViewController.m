//
//  ShopDetailViewController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "shopHeaderViewModel.h"
#import "UIView+Addition.h"
#import "UILabel+Addition.h"
#import "LoopViewModel.h"
#import "loopView.h"

//借此处位置写了一个分类,非常巧妙
@interface HMScrollView : UIScrollView

@end

//重写了scrollView的方法实现,scrollerView自带平移和捏合手势,屏蔽了触摸手势
@implementation HMScrollView

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.viewControler dismissViewControllerAnimated:YES completion:nil];
}

@end


@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI{
    UIImageView *bgImageView = [[UIImageView alloc] init];
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:[_shopPOIInfoModel.poi_back_pic_url stringByDeletingPathExtension]]];
    [self.view addSubview:bgImageView];
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    
    
    //
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    [self.view addSubview:closeBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
    }];
    
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    HMScrollView *scrollView = [[HMScrollView alloc] init];
    
    [self.view addSubview:scrollView];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.equalTo(closeBtn.mas_top).offset(-60);
    }];
    
    
 
    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.width.equalTo(scrollView);
        
    }];
    
    
    
    UILabel *shopNameLabel = [UILabel makeLabelWithText:_shopPOIInfoModel.name andTextFont:14 andTextColor:[UIColor whiteColor]];
    
    [contentView addSubview:shopNameLabel];
    
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(64);
    }];
    
    
    
    UILabel *shopTipLabel = [UILabel makeLabelWithText:[NSString stringWithFormat:@"%@ | %@ | %@", _shopPOIInfoModel.min_price_tip, _shopPOIInfoModel.shipping_fee_tip, _shopPOIInfoModel.delivery_time_tip] andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    [contentView addSubview:shopTipLabel];
    
    [shopTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopNameLabel.mas_bottom).offset(16 * 0.5);
    }];
    
    
    UILabel *shopDiscountLabel = [UILabel makeLabelWithText:@"折扣信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [contentView addSubview:shopDiscountLabel];
    
    [shopDiscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopTipLabel.mas_bottom).offset(16 * 2.5);
    }];
    
    
    UIView *shopDiscountLineViewLeft = [[UIView alloc] init];
    shopDiscountLineViewLeft.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopDiscountLineViewLeft];
    
    [shopDiscountLineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.height.offset(1);
        make.right.equalTo(shopDiscountLabel.mas_left).offset(-16);
        make.centerY.equalTo(shopDiscountLabel).offset(0);
    }];
    
    
    UIView *shopDiscountLineViewRight = [[UIView alloc] init];
    shopDiscountLineViewRight.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopDiscountLineViewRight];
    
    [shopDiscountLineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.height.offset(1);
        make.left.equalTo(shopDiscountLabel.mas_right).offset(16);
        make.centerY.equalTo(shopDiscountLabel).offset(0);
    }];
    
    
    
    
    UIStackView *stackView = [[UIStackView alloc] init];
    
    
    stackView.axis = UILayoutConstraintAxisVertical;
    
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    stackView.spacing = 10;
    
    
    for (LoopViewModel *infoModel in _shopPOIInfoModel.discounts2) {
        
        loopView *infoView = [[loopView alloc] init];
        infoView.loopViewModel = infoModel;
        
        [stackView addArrangedSubview:infoView];
    }
    
    [contentView addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(shopDiscountLabel.mas_bottom).offset(16);
        make.height.offset(_shopPOIInfoModel.discounts2.count * 30);
    }];
    
    
    
    UILabel *shopBulletinLabel = [UILabel makeLabelWithText:@"公告信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [contentView addSubview:shopBulletinLabel];
    
    [shopBulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(stackView.mas_bottom).offset(16 * 2.5);
    }];
    
    
    
    
    UIView *shopBulletinLineViewLeft = [[UIView alloc] init];
    shopBulletinLineViewLeft.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopBulletinLineViewLeft];
    
    [shopBulletinLineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.height.offset(1);
        make.right.equalTo(shopBulletinLabel.mas_left).offset(-16);
        make.centerY.equalTo(shopBulletinLabel).offset(0);
    }];
    
    
    UIView *shopBulletinLineViewRight = [[UIView alloc] init];
    shopBulletinLineViewRight.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopBulletinLineViewRight];
    
    [shopBulletinLineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.height.offset(1);
        make.left.equalTo(shopBulletinLabel.mas_right).offset(16);
        make.centerY.equalTo(shopBulletinLabel).offset(0);
    }];
    
    
    UILabel *shopBulletionInfoLabel = [UILabel makeLabelWithText:_shopPOIInfoModel.bulletin andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [contentView addSubview:shopBulletionInfoLabel];
    shopBulletionInfoLabel.numberOfLines = 0;
    
    [shopBulletionInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.top.equalTo(shopBulletinLabel.mas_bottom).offset(16);
        make.right.offset(-16);
        
        make.bottom.offset(-16);
    }];
    

}

- (void)closeBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
