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
#import "NSObject+LineFormula.h"

@interface FoodDetailCell ()<UIScrollViewDelegate>
//约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LayoutConstraint;
//头部图片
@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;
//店名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//月售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;
//价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;
//详情
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
//食物评论
@property (weak, nonatomic) IBOutlet UILabel *foodCommentLabel;
//好评条
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
//赞数
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
//滚动视图
@property (weak, nonatomic) IBOutlet UIScrollView *SCrollView;
//商品详情
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;



@end

@implementation FoodDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
//重写set方法赋值
- (void)setFoodModel:(ShopFoodModel *)foodModel {
    _foodModel = foodModel;
    //给图片赋值
    [_pictureImage sd_setImageWithURL:[NSURL URLWithString:[foodModel.picture stringByDeletingPathExtension]] placeholderImage:[UIImage imageNamed:@"img_food_loading"]];
    
    _nameLabel.text = foodModel.name;
    
    _month_saled_contentLabel.text = foodModel.month_saled_content;
    
    _min_priceLabel.text = [NSString stringWithFormat:@"¥ %@", @(foodModel.min_price)];
    
    _descriptionLabel.text = foodModel.description1;
    
    CGFloat percent = 0;
    //计算好评率
    if (foodModel.praise_num + foodModel.tread_num != 0) {
        
        percent = foodModel.praise_num / (foodModel.praise_num + foodModel.tread_num);
    }
    
    _percentLabel.text = [NSString stringWithFormat:@"%.f%%", percent * 100];
    //修改进度条进度
    _progressView.progress = percent;
    
    //判断详情界面是否有值
    NSString *descriptionIsEmpty= [foodModel.description1 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    _infoLabel.hidden = [descriptionIsEmpty isEqualToString:@""];
    
    _LayoutConstraint.constant = [descriptionIsEmpty isEqualToString:@""] ? -24 : 8;
    //设置代理
    _SCrollView.delegate = self;
    
}

//设置下拉放大
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY <= 0) {
        //先计算出缩放比例
        CGFloat scale = [@(offsetY) lineFormulaResultAndVlaue1:JZGValueMake(1,0 ) AndVlaue2:JZGValueMake(2, -240)];
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        transform = CGAffineTransformTranslate(transform, 0, offsetY * 0.5);
        transform = CGAffineTransformScale(transform, scale, scale);
        
        _pictureImage.transform = transform;
        
    }else{
        //如果拉回则回复初始值
        _pictureImage.transform = CGAffineTransformIdentity;
        
    }
    
    
    
   }


@end
