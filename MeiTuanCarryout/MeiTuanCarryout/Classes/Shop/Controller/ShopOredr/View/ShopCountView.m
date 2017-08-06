//
//  ShopCountView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopCountView.h"

@interface ShopCountView ()
//减号按钮
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
//加号按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;
//计数label
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation ShopCountView
//从Xib创建
+(instancetype)shopCountView{
    return [[[UINib nibWithNibName:@"ShopCountView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

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
    [self updataState];
}


//当model中没值时将减号及label隐藏
-(void)updataState{
    if (_model.counts > 0) {
        
        _subtractButton.hidden =NO;
        _countLabel.hidden = NO;
    }else{
        _subtractButton.hidden =YES;
        _countLabel.hidden = YES;
    }
    
     _countLabel.text = @(_model.counts).description;
    
}
//点击减号时给计数复制
- (IBAction)subtractButtonClick {
    
    _model.counts--;
    
    [self updataState];
    
    _buttonType = ShopCountViewButtonTypeSub;
    
    if ([self.delegate respondsToSelector:@selector(shopCountViewDelegateClickButton:)]) {
        [self.delegate shopCountViewDelegateClickButton:self];
    }
    
}
//点击加号时给计数复制
- (IBAction)addButtonClick {
    
    _model.counts++;
    
    [self updataState];
    
    _buttonType = ShopCountViewButtonTypeAdd;
    
    if ([self.delegate respondsToSelector:@selector(shopCountViewDelegateClickButton:)]) {
        [self.delegate shopCountViewDelegateClickButton:self];
    }
}
//刷新数据
-(void)setModel:(ShopFoodModel *)model{
    _model = model;
    
   
    
    [self updataState];
}

@end
