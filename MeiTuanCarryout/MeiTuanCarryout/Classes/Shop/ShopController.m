//
//  ShopController.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/7/30.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ShopController.h"
#import "FoodDetailController.h"
#import "Masonry.h"
#import "NSObject+LineFormula.h"
#import "JZGNavigationBar.h"

#define KHeaderViewHeightMax 180
#define KHeaderViewHeightMin 64

@interface ShopController ()

@property (nonatomic, weak) UIView *headerView;


@end

@implementation ShopController

- (void)viewDidLoad {
    

    
    self.view.backgroundColor = [UIColor whiteColor];
    //修改标题
    self.navItem.title = @"沙县小吃";
    //设置头部标题颜色
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:0]};
    //设置头部标签背景
    self.navBar.imageView.alpha = 0;
    //设置右侧图标
    self.navItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navBar.tintColor = [UIColor colorWithWhite:0.4 alpha:1];
    //创建头部视图
    UIView *hesderView = [[UIView alloc] init];
    //添加背景颜色
    hesderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //将头部视图添加到父控件上
    [self.view addSubview:hesderView];
    //添加约束
    [hesderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(180);
    }];
    
    [super viewDidLoad];
    _headerView = hesderView;
    
    
    
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    //添加手势
    [self.view addGestureRecognizer:pan];
   

}

-(void)panGesture:(UIPanGestureRecognizer *)pan{
    //先拿到相对位置
    CGPoint p = [pan translationInView:pan.view];
    //头部视图当前的高度
    CGFloat height = _headerView.bounds.size.height;
    
    [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        if(p.y +height >= KHeaderViewHeightMax){
            
            make.height.offset(KHeaderViewHeightMax);
            
        }else if (p.y +height <= KHeaderViewHeightMin){
            
            make.height.offset(KHeaderViewHeightMin);
            
        }else{
            
            make.height.offset(p.y +height);
        }
    }];
    
    CGFloat alpha = [@(height) lineFormulaResultAndVlaue1:JZGValueMake(1, 64) AndVlaue2:JZGValueMake(0, 180)];
    
    self.navBar.imageView.alpha = alpha;
    
    //设置头部标题颜色
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:alpha]};
    
    //设置titinColor的颜色
    CGFloat white = [@(height) lineFormulaResultAndVlaue1:JZGValueMake(0.4, 64) AndVlaue2:JZGValueMake(1, 180)];
    
    self.navBar.tintColor = [UIColor colorWithWhite:white alpha:1];
    
    //设置状态栏
    if(p.y +height == KHeaderViewHeightMax && self.statusBarStyle != UIStatusBarStyleLightContent){
        
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    }else if (p.y +height == KHeaderViewHeightMin && self.statusBarStyle != UIStatusBarStyleDefault){
        
        self.statusBarStyle = UIStatusBarStyleDefault;
        
    }
    
    // 恢复到初始值
    [pan setTranslation:CGPointZero inView:pan.view];
}



//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    FoodDetailController *vc = [[FoodDetailController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
