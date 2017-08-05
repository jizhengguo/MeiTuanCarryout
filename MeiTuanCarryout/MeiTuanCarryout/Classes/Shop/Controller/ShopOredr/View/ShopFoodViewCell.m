//
//  ShopFoodViewCell.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/2.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopFoodViewCell.h"
#import "ShopFoodModel.h"
#import "UIImageView+WebCache.h"
#import "ShopCountView.h"
#import "Masonry.h"

@interface ShopFoodViewCell ()
//头像
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
//店名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//详情
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
//月售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;
//售价
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;
//赞数
@property (weak, nonatomic) IBOutlet UILabel *praise_contentLabel;
//约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutCount;
//容器视图
@property (nonatomic, weak) ShopCountView *countView;


@end

@implementation ShopFoodViewCell

//接受模型并复制
-(void)setModel:(ShopFoodModel *)model{
    _model = model;
    
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:[model.picture stringByDeletingPathExtension]]];
    
    _nameLabel.text = model.name;
    
    _descriptionLabel.text = model.description1;
    
    _month_saled_contentLabel.text = model.month_saled_content;
    
    _min_priceLabel.text = @(model.min_price).description;
    
    _praise_contentLabel.text = model.praise_content;
    //判断详情是否有值,如果没有内容就改变约束
    _layoutCount.constant = ([model.description1 stringByReplacingOccurrencesOfString:@" " withString:@""].length > 0) ? 8 : 0;
    
    _countView.model = model;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

-(void)setupUI{
    //添加计数器视图
    ShopCountView *countView = [ShopCountView shopCountView];
    
    [self.contentView addSubview:countView];
    
    [countView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.right.offset(-8);
        make.width.offset(90);
        make.height.offset(27);
        
    }];
    
    _countView = countView;
    
}




@end
