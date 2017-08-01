//
//  ShopHeaderView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopHeaderView.h"
#import "Masonry.h"
#import "UILabel+Addition.h"

@interface ShopHeaderView ()
//背景图片
@property (nonatomic, weak) UIImageView *backGroundImage;

//滚动视图
@property (nonatomic, weak) UIView *loopView;

//头像视图
@property (nonatomic, weak) UIImageView *avadarView;

//店名label
@property (nonatomic, weak) UILabel *nameLabel;

//广告label
@property (nonatomic, weak) UILabel *bulletinLabel;

@end

@implementation ShopHeaderView

-(void)drawRect:(CGRect)rect{
    //开启上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置初始点
    CGContextMoveToPoint(ctx,16, CGRectGetMinY(_loopView.frame)-8);
    //设置结束点
    CGContextAddLineToPoint(ctx,self.bounds.size.width,  CGRectGetMinY(_loopView.frame)-8);
    //设置为虚线
    CGFloat lengths[] = {2,2};
    CGContextSetLineDash(ctx, 0, lengths, 2);
    //设置虚线颜色
    [[UIColor whiteColor] set];
    
    //渲染
    CGContextStrokePath(ctx);
    
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
    //创建背景图片
    UIImageView *backGroundImage = [[UIImageView alloc]init];
    
    backGroundImage.backgroundColor = [UIColor blueColor];
    
    [self addSubview:backGroundImage];
    
    [backGroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    _backGroundImage = backGroundImage;
    //从下向上布局,创建滚动条
    
    UIView *loopView = [[UIView alloc]init];
    loopView.backgroundColor = [UIColor redColor];
    [self addSubview:loopView];
    //添加约束
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-8);
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(20);
    }];
    
    _loopView = loopView;
    
    //创建头像
    UIImageView *avadarView = [[UIImageView alloc]init];
    avadarView.backgroundColor = [UIColor yellowColor];
    [self addSubview:avadarView];
    //切圆角
    avadarView.layer.cornerRadius = 32;
    avadarView.clipsToBounds = YES;
    //设置边框
    avadarView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    avadarView.layer.borderWidth = 2;
    //设置填充模式
    avadarView.contentMode = UIViewContentModeScaleAspectFill;
    //添加约束
    [avadarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(loopView.mas_top).offset(-16);
        make.left.equalTo(loopView).offset(0);
        make.width.height.offset(64);
    }];
    
    _avadarView = avadarView;
    
    //设置名称label
    UILabel *nameLabel = [UILabel makeLabelWithText:@"详情" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avadarView.mas_right).offset(16);
        make.centerY.equalTo(avadarView).offset(-16);
    }];
    
    _nameLabel = nameLabel;
    
    //设置广告label
    UILabel *bulletinLabel = [UILabel makeLabelWithText:@"广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告" andTextFont:14 andTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    
    [self addSubview:bulletinLabel];
    
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.centerY.equalTo(avadarView).offset(16);
        make.right.offset(-16);
    }];
    
    _bulletinLabel = bulletinLabel;
    
    //设置运行循环,为啥不行??
//    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(animation) userInfo:nil repeats:nil];
//    
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //添加无线循环
    [self animation];
}

-(void)animation{
    [UIView transitionWithView:_loopView duration:0.25 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        if (_loopView.backgroundColor == [UIColor redColor]) {
            
            _loopView.backgroundColor = [UIColor yellowColor];
        }else if(_loopView.backgroundColor == [UIColor yellowColor]){
            _loopView.backgroundColor = [UIColor redColor];
            
        }
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self animation];
        });
    }];

}

-(void)layoutSubviews{
    [self setNeedsDisplay];
}





@end
