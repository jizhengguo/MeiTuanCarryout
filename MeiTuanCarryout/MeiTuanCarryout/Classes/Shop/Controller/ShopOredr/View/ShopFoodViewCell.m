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

@interface ShopFoodViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *praise_contentLabel;

@end

@implementation ShopFoodViewCell


-(void)setModel:(ShopFoodModel *)model{
    _model = model;
    
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:[model.picture stringByDeletingPathExtension]]];
    
    _nameLabel.text = model.name;
    
    _descriptionLabel.text = model.description1;
    
    _month_saled_contentLabel.text = model.month_saled_content;
    
    _min_priceLabel.text = @(model.min_price).description;
    
    _praise_contentLabel.text = model.praise_content;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
