//
//  JZGBasicController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "JZGBasicController.h"
#import "Masonry.h"


@interface JZGBasicController ()

@end

@implementation JZGBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建navbar
    UINavigationBar *navBar = [[UINavigationBar alloc]init];
    

    //将导航栏变成透明
    navBar.shadowImage = [UIImage new];
    [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //创建一个navItem
    UINavigationItem *navItem = [[UINavigationItem alloc]init];
    //使其与导航条建立联系
    [navBar setItems:@[navItem]];
    
    //添加到父控件上
    [self.view addSubview:navBar];
    
    //设置导航条约束
    [navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(64);
    }];
    
    //赋值
    _navItem = navItem;
    _navBar = navBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (self.isViewLoaded &&self.view.window == nil) {
        self.view = nil;
    }
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
