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
//创建UI界面
-(void)setupUI{
    //创建背景图片View
    UIImageView *bgImageView = [[UIImageView alloc] init];
    //添加图片
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:[_shopPOIInfoModel.poi_back_pic_url stringByDeletingPathExtension]]];
    //添加到父控件
    [self.view addSubview:bgImageView];
    //
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //添加关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    //设置默认状态图片
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    //设置高亮图片
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    [self.view addSubview:closeBtn];
    //约束
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
    }];
    //添加监听方法
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //创滚动视图
    HMScrollView *scrollView = [[HMScrollView alloc] init];
    [self.view addSubview:scrollView];
    //隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    //约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.equalTo(closeBtn.mas_top).offset(-60);
    }];
    //内容view
    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.width.equalTo(scrollView);
        
    }];
    //店铺名称
    UILabel *shopNameLabel = [UILabel makeLabelWithText:_shopPOIInfoModel.name andTextFont:14 andTextColor:[UIColor whiteColor]];
    
    [contentView addSubview:shopNameLabel];
    
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(64);
    }];
    //信息标签
    UILabel *shopTipLabel = [UILabel makeLabelWithText:[NSString stringWithFormat:@"%@ | %@ | %@", _shopPOIInfoModel.min_price_tip, _shopPOIInfoModel.shipping_fee_tip, _shopPOIInfoModel.delivery_time_tip] andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    [contentView addSubview:shopTipLabel];
    
    [shopTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopNameLabel.mas_bottom).offset(16 * 0.5);
    }];
    //折扣信息
    UILabel *shopDiscountLabel = [UILabel makeLabelWithText:@"折扣信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [contentView addSubview:shopDiscountLabel];
    
    [shopDiscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopTipLabel.mas_bottom).offset(16 * 2.5);
    }];
    //左边线
    UIView *shopDiscountLineViewLeft = [[UIView alloc] init];
    shopDiscountLineViewLeft.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopDiscountLineViewLeft];
    
    [shopDiscountLineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.height.offset(1);
        make.right.equalTo(shopDiscountLabel.mas_left).offset(-16);
        make.centerY.equalTo(shopDiscountLabel).offset(0);
    }];
    //右边线
    UIView *shopDiscountLineViewRight = [[UIView alloc] init];
    shopDiscountLineViewRight.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopDiscountLineViewRight];
    
    [shopDiscountLineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.height.offset(1);
        make.left.equalTo(shopDiscountLabel.mas_right).offset(16);
        make.centerY.equalTo(shopDiscountLabel).offset(0);
    }];
    //逆向布局,重叠视图
    UIStackView *stackView = [[UIStackView alloc] init];
    //设置重叠方向
    stackView.axis = UILayoutConstraintAxisVertical;
    //设置重叠样式
    stackView.distribution = UIStackViewDistributionFillEqually;
    //设置间距
    stackView.spacing = 10;
    
    //循环遍历逐一将滚动视图添加到stackView中
    for (LoopViewModel *infoModel in _shopPOIInfoModel.discounts2) {
        
        loopView *infoView = [[loopView alloc] init];
        infoView.loopViewModel = infoModel;
        
        [stackView addArrangedSubview:infoView];
    }
    //将父视图添加到contentView中
    [contentView addSubview:stackView];
    //给其添加约束
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(shopDiscountLabel.mas_bottom).offset(16);
        make.height.offset(_shopPOIInfoModel.discounts2.count * 30);
    }];
    //商家广告Label
    UILabel *shopBulletinLabel = [UILabel makeLabelWithText:@"公告信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [contentView addSubview:shopBulletinLabel];
    
    [shopBulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(stackView.mas_bottom).offset(16 * 2.5);
    }];
    
    //左侧白线
    UIView *shopBulletinLineViewLeft = [[UIView alloc] init];
    shopBulletinLineViewLeft.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopBulletinLineViewLeft];
    
    [shopBulletinLineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.height.offset(1);
        make.right.equalTo(shopBulletinLabel.mas_left).offset(-16);
        make.centerY.equalTo(shopBulletinLabel).offset(0);
    }];
    
    //右侧白线
    UIView *shopBulletinLineViewRight = [[UIView alloc] init];
    shopBulletinLineViewRight.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopBulletinLineViewRight];
    
    [shopBulletinLineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.height.offset(1);
        make.left.equalTo(shopBulletinLabel.mas_right).offset(16);
        make.centerY.equalTo(shopBulletinLabel).offset(0);
    }];
    
    //广告详情
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
//点击退出按钮执行dismiss命令退出modal
- (void)closeBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//修改顶部状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


//给控制器添加touchEnd时执行dissmiss  关闭按钮旁边范围点击退出modal
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
