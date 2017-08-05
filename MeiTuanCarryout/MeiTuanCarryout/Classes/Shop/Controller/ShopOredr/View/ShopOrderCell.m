//
//  ShopOrderCell.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopOrderCell.h"
#import "DushView.h"
#import "Masonry.h"
@implementation ShopOrderCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}
//重写init方法,uitableViewcell需要重写initWithStyle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //修改label字体,并修改最大行数
    self.textLabel.font = [UIFont systemFontOfSize:12];
    self.textLabel.numberOfLines = 2;
    //设置背景颜色
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    //设置虚线
    DushView *dushView = [[DushView alloc]init];
    dushView.backgroundColor = [UIColor blackColor];
//    [self.contentView addSubview:dushView];
    self.backgroundView = dushView ;
    
    [dushView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.offset(0);
        make.height.offset(1);
    }];
    //设置选中视图
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor whiteColor];

    //设置指引小黄条
    UIView *yellowLineView = [[UIView alloc] init];
    yellowLineView.backgroundColor = [UIColor yellowColor];
    [selectedView addSubview:yellowLineView];
    self.selectedBackgroundView = selectedView;
    
    [yellowLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.offset(0);
        make.width.offset(4);
        make.height.offset(44);
    }];

}



@end
