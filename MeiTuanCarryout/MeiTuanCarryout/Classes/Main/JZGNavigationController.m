//
//  JZGNavigationController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "JZGNavigationController.h"
#import "JZGBasicController.h"

@interface JZGNavigationController ()

@end

@implementation JZGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏导航栏
    self.navigationBar.hidden = YES;
}
//重写push方法
-(void)pushViewController:(JZGBasicController *)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:animated];
    //判断是否为根控制器
    
    if (self.childViewControllers.count > 1) {
        //如果不是跟控制器则添加返回按钮
        viewController.navItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
}

- (void)back{
    //返回方法
    [self popViewControllerAnimated:YES];
}

//把修改状态栏的权利交给子控件
-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
