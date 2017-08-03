//
//  ShopDetailAnimation.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/3.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopDetailAnimation.h"

@interface ShopDetailAnimation ()<UIViewControllerAnimatedTransitioning>

//定义标记属性
@property (nonatomic, assign) BOOL isPresent;

@end

@implementation ShopDetailAnimation

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    _isPresent = NO;
    
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    _isPresent = YES;
    
    return self;
}


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.25;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    if (_isPresent == YES) {
        
        toView.transform = CGAffineTransformMakeScale(0, 0);
        
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            // 恢复transform
            toView.transform = CGAffineTransformIdentity;
            
            
        } completion:^(BOOL finished) {
            
            // 转场完成后告诉系统转场完成
            [transitionContext completeTransition:YES];
        }];
        
    }else{
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            
            fromView.transform = CGAffineTransformMakeScale(0.1, 0.1);
            
            
        } completion:^(BOOL finished) {
            
            // 转场完成后告诉系统转场完成
            [transitionContext completeTransition:YES];
        }];
        
    }
    
}


@end
