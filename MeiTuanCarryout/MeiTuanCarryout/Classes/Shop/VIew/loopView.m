//
//  loopView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "loopView.h"
#import "Masonry.h"
#import "UILabel+Addition.h"
#import "UIImageView+WebCache.h"
#import "LoopViewModel.h"

@interface loopView ()

//小图标
@property (nonatomic, weak) UIImageView *iconView;
//滚动消息
@property (nonatomic, weak) UILabel *infoLabel;

//索引
@property (nonatomic, assign) NSInteger index;



@end

@implementation loopView


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
    //小图标
    UIImageView *iconView = [[UIImageView alloc]init];
//    iconView.backgroundColor = [UIColor redColor];
    [self addSubview: iconView];
    //约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.offset(0);
        make.height.width.offset(20);
    }];
    _iconView = iconView;
    
    //消息标签
    UILabel *infoLabel = [UILabel makeLabelWithText:@"快来吃" andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    [self addSubview:infoLabel];
    //约束
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(8);
        make.right.offset(0);
        make.centerY.offset(0);
    }];
    _infoLabel = infoLabel;
    
    
    
        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(animation) userInfo:nil repeats:YES];
    
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //添加无线循环
}
//设置滚动效果
-(void)animation{
    //设置转场动画
    [UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
        
        _index = (_index + 7) % 7;
        
            NSURL *url = [NSURL URLWithString:_loopViewModel[_index].icon_url];
            [_iconView sd_setImageWithURL:url];
            
            _infoLabel.text = _loopViewModel[_index].info;
        
        _index++;
      
    } completion:nil];
    
    
    
}

//传值
-(void)setLoopViewModel:(NSArray<LoopViewModel *> *)loopViewModel{
    _loopViewModel = loopViewModel;
    NSURL *url = [NSURL URLWithString:loopViewModel[0].icon_url];
    [_iconView sd_setImageWithURL:url];
    
    _infoLabel.text = loopViewModel[0].info;
    
    [self animation];
}
@end
