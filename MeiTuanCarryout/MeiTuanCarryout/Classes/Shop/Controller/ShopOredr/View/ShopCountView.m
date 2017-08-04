//
//  ShopCountView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopCountView.h"

@interface ShopCountView ()
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation ShopCountView

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

- (IBAction)subtractButtonClick {
    
    _model.counts--;
    
    [self updataState];
    
}
- (IBAction)addButtonClick {
    
    _model.counts++;
    
    [self updataState];
}

-(void)setModel:(ShopFoodModel *)model{
    _model = model;
    
   
    
    [self updataState];
}

@end
