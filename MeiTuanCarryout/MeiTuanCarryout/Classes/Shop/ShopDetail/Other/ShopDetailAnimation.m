//
//  ShopDetailAnimation.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopDetailAnimation.h"


//自定义专场动画必须设置代理
@interface ShopDetailAnimation ()<UIViewControllerAnimatedTransitioning>

//定义标记属性
@property (nonatomic, assign) BOOL isPresent;

@end

@implementation ShopDetailAnimation

//自定义专场动画返回dismiss执行者
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    _isPresent = NO;
    
    return self;
}
//自定义专场动画跳转modal的执行者
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    _isPresent = YES;
    
    return self;
}

//返回动画时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.25;
}
//自定义专场动画
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //获取modal出来的界面
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //获取执行modal的界面
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //设置容器视图,将modal出来的界面放入容器视图
    UIView *containerView = [transitionContext containerView];
    //判断是否为modal界面
    if (_isPresent == YES) {
        //从0.0比例进行缩放
        toView.transform = CGAffineTransformMakeScale(0, 0);
        //添加到容器视图中
        [containerView addSubview:toView];
        //用动画进行处理,动画时长为转场时长
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            // 恢复transform
            toView.transform = CGAffineTransformIdentity;
            
            
        } completion:^(BOOL finished) {
            
            // 转场完成后告诉系统转场完成
            [transitionContext completeTransition:YES];
        }];
        
    }else{
        //设置动画
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            //不能让跳出界面直接变为0.0   没有动画效果  需要设置为0.1  0.1
            fromView.transform = CGAffineTransformMakeScale(0.1, 0.1);
            
            
        } completion:^(BOOL finished) {
            
            // 转场完成后告诉系统转场完成
            [transitionContext completeTransition:YES];
        }];
        
    }
    
}


@end
