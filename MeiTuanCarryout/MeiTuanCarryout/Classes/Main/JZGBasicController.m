//
//  JZGBasicController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "JZGBasicController.h"
#import "Masonry.h"
#import "JZGNavigationBar.h"


@interface JZGBasicController ()

@end

@implementation JZGBasicController

-(void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle{
    _statusBarStyle = statusBarStyle;
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //创建navbar
         JZGNavigationBar *navBar = [[JZGNavigationBar alloc]init];
        //创建一个navItem
        UINavigationItem *navItem = [[UINavigationItem alloc]init];
        //使其与导航条建立联系
        [navBar setItems:@[navItem]];
        
        //赋值
        _navItem = navItem;
        _navBar = navBar;
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加到父控件上
    [self.view addSubview:self.navBar];
    
    //设置导航条约束
    [self.navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(64);
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (self.isViewLoaded &&self.view.window == nil) {
        self.view = nil;
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return self.statusBarStyle;
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
