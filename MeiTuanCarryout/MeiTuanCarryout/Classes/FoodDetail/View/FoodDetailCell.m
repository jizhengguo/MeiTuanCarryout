//
//  FoodDetailCell.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/4.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "FoodDetailCell.h"
#import "ShopFoodModel.h"
#import "UIImageView+WebCache.h"

@interface FoodDetailCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LayoutConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodCommentLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *SCrollView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;



@end

@implementation FoodDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setFoodModel:(ShopFoodModel *)foodModel {
    _foodModel = foodModel;
    
    [_pictureImage sd_setImageWithURL:[NSURL URLWithString:[foodModel.picture stringByDeletingPathExtension]] placeholderImage:[UIImage imageNamed:@"img_food_loading"]];
    
    _nameLabel.text = foodModel.name;
    
    _month_saled_contentLabel.text = foodModel.month_saled_content;
    
    _min_priceLabel.text = [NSString stringWithFormat:@"¥ %@", @(foodModel.min_price)];
    
    _descriptionLabel.text = foodModel.description1;
    
    CGFloat percent = 0;
    if (foodModel.praise_num + foodModel.tread_num != 0) {
        
        percent = foodModel.praise_num / (foodModel.praise_num + foodModel.tread_num);
    }
    
    _percentLabel.text = [NSString stringWithFormat:@"%.f%%", percent * 100];
    
    _progressView.progress = percent;
    
    
    NSString *descriptionIsEmpty= [foodModel.description1 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    _infoLabel.hidden = !descriptionIsEmpty;
    
    _LayoutConstraint.constant = descriptionIsEmpty ? 20 : -25;
    
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
    
   }


@end
