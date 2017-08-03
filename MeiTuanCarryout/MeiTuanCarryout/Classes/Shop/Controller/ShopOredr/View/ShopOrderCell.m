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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.textLabel.font = [UIFont systemFontOfSize:12];
    self.textLabel.numberOfLines = 2;
    
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    DushView *dushView = [[DushView alloc]init];
    dushView.backgroundColor = [UIColor blackColor];
//    [self.contentView addSubview:dushView];
    self.backgroundView = dushView ;
    
    [dushView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.offset(0);
        make.height.offset(1);
    }];
    
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor whiteColor];

    
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
