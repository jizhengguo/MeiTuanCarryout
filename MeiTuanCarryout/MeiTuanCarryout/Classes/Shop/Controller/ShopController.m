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
#import "ShopOrderController.h"
#import "ShopCommentController.h"
#import "ShopInfoController.h"

#define KHeaderViewHeightMax 180
#define KHeaderViewHeightMin 64

@interface ShopController ()<UIScrollViewDelegate>
//创建头部视图
@property (nonatomic, weak) UIView *headerView;
//创建标签视图
@property (nonatomic, weak) UIView *shopTagView;
//创建滚动视图
@property (nonatomic, weak) UIScrollView *shopScrollView;
//创建黄色指示View
@property (nonatomic, weak) UIView *yellowView;




@end

@implementation ShopController

- (void)viewDidLoad {
    
    [self setupUI];
    
    [super viewDidLoad];
    
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    //添加手势
    [self.view addGestureRecognizer:pan];
   

}

-(void)setupUI{
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
    [self settingHeaderView];
    //创建标签视图
    [self settingShopTagView];
    //创建滚动视图
    [self settingShopScrollView];

}
#pragma mark - 设置头部视图
-(void)settingHeaderView{
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
    _headerView = hesderView;

}
#pragma mark - 设置标签视图
-(void)settingShopTagView{
    //创建标签视图
    UIView *shopTagView = [[UIView alloc]init];
    //添加背景颜色
    shopTagView.backgroundColor = [UIColor whiteColor];
    //添加到父控件
    [self.view addSubview:shopTagView];
    //设置约束
    [shopTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.left.height.offset(44);
    }];
    //赋值
    _shopTagView = shopTagView;
    //添加按钮
    UIButton *button = [self makeButtonWithTitle:@"点餐"];
    [self makeButtonWithTitle:@"评论"];
    [self makeButtonWithTitle:@"详情"];
    //设置初始加粗
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    //设置约束
    [shopTagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [shopTagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    //创建黄色小条
    UIView *yellowView = [[UIView alloc]init];
    //设置颜色
    yellowView.backgroundColor = [UIColor orangeColor];
    //加入父控件
    [shopTagView addSubview:yellowView];
    //设置约束
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.height.offset(4);
        make.width.offset(40);
        make.centerX.equalTo(button);
        
    }];
    
    _yellowView = yellowView;
    
    
    
    
}

-(UIButton *)makeButtonWithTitle:(NSString *)title{
    //创建按钮
    UIButton *btn = [[UIButton alloc]init];
    //设置文字
    [btn setTitle:title forState:UIControlStateNormal];
    //设置字体
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    //设置文字颜色
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //添加到父控件
    [_shopTagView addSubview:btn];
    return btn;
}

#pragma mark - 设置滚动视图
-(void)settingShopScrollView{
    //创建滚动视图
    UIScrollView *shopScrollView = [[UIScrollView alloc]init];
    //添加到父控件
    [self.view addSubview:shopScrollView];
    //设置约束
    [shopScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_shopTagView.mas_bottom);
        make.left.right.bottom.offset(0);
        
    }];
    
    ShopOrderController *vc1 = [[ShopOrderController alloc]init];
    ShopCommentController *vc2 = [[ShopCommentController alloc]init];
    ShopInfoController *vc3 = [[ShopInfoController alloc]init];
    
    NSArray <UIViewController *>*arr = @[vc1, vc2, vc3];
    
    for (NSInteger i = 0; i < arr.count; i++) {
        //将其添加到父控件中
        [shopScrollView addSubview:arr[i].view];
        //将其控制器添加到父控制器
        [self addChildViewController:arr[i]];
        //确定添加
        [arr[i] didMoveToParentViewController:self];
    }
    //设置约束
    [shopScrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.height.width.equalTo(shopScrollView);
        
    }];
    
    [shopScrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    //设置代理
    shopScrollView.delegate = self;
    //关闭弹簧效果
    shopScrollView.bounces = NO;
    //设置分页效果
    shopScrollView.pagingEnabled = YES;
    //关闭滚动条
    shopScrollView.showsVerticalScrollIndicator = NO;
    shopScrollView.showsHorizontalScrollIndicator = NO;
    
    //赋值
    _shopScrollView = shopScrollView;
    
}


#pragma mark - 设置手势
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
    if(p.y +height >= KHeaderViewHeightMax && self.statusBarStyle != UIStatusBarStyleLightContent){
        
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    }else if (p.y +height <= KHeaderViewHeightMin && self.statusBarStyle != UIStatusBarStyleDefault){
        
        self.statusBarStyle = UIStatusBarStyleDefault;
        
    }
    
    // 恢复到初始值
    [pan setTranslation:CGPointZero inView:pan.view];
}

#



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
