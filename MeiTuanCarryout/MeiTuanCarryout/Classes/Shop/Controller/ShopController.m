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
#import "ShopHeaderView.h"
#import "shopHeaderViewModel.h"
#import "ShopOrderModel.h"
#import "ShopCarView.h"

#define KHeaderViewHeightMax 180
#define KHeaderViewHeightMin 64

@interface ShopController ()<UIScrollViewDelegate , UIGestureRecognizerDelegate>
//创建头部视图
@property (nonatomic, weak) ShopHeaderView *headerView;
//创建标签视图
@property (nonatomic, weak) UIView *shopTagView;
//创建滚动视图
@property (nonatomic, weak) UIScrollView *shopScrollView;
//创建黄色指示View
@property (nonatomic, weak) UIView *yellowView;
//头部视图数据
@property (nonatomic, strong) shopHeaderViewModel *shopHeaderViewModel;
//点餐视图数据
@property (nonatomic, strong) NSArray<ShopOrderModel *> *shopOrderModel;
//table数组
@property (nonatomic, weak) ShopOrderController *orderVC;





@end

@implementation ShopController

- (void)viewDidLoad {
    [self loadShopControllerData];
    
    [self setupUI];
    
    [super viewDidLoad];
    
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    //添加手势
    [self.view addGestureRecognizer:pan];
    
    pan.delegate = self;
    
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
    ShopHeaderView *hesderView = [[ShopHeaderView alloc] init];
    //添加背景颜色
    hesderView.backgroundColor = [UIColor orangeColor];
    //将头部视图添加到父控件上
    [self.view addSubview:hesderView];
    //添加约束
    [hesderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(180);
    }];
    
    hesderView.model = _shopHeaderViewModel;
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
#pragma mark - 创建按钮
-(UIButton *)makeButtonWithTitle:(NSString *)title{
    //创建按钮
    UIButton *btn = [[UIButton alloc]init];
    //设置文字
    [btn setTitle:title forState:UIControlStateNormal];
    //设置字体
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    //设置文字颜色
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置tag
    btn.tag = _shopTagView.subviews.count;
    //添加到父控件
    [_shopTagView addSubview:btn];
    //设置监听方法
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}
#pragma mark - 设置监听方法
-(void)buttonClick:(UIButton *)button{
    [UIView animateWithDuration:0.25 animations:^{
        _shopScrollView.contentOffset = CGPointMake(button.tag * _shopScrollView.bounds.size.width, 0);
        //设置黄条位置
        _yellowView.transform = CGAffineTransformMakeTranslation(button.tag * button.bounds.size.width, 0);
    }];
    //判断联动
    for (NSInteger i = 0; i < _shopTagView.subviews.count-1; i++) {
        if (_shopTagView.subviews[i].tag == button.tag) {
            ((UIButton *)_shopTagView.subviews[i]).titleLabel.font = [UIFont boldSystemFontOfSize:14];
        }else{
            ((UIButton *)_shopTagView.subviews[i]).titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }
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
    //创建滚动视图中的三个自控制器
    ShopOrderController *vc1 = [[ShopOrderController alloc]init];
    //传递数据
    vc1.shopOrderModel = _shopOrderModel;
    
    _orderVC = vc1;
    
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
    
    if (_shopScrollView.isDragging == YES) {
        return;
    }
    
    for (UITableView *tableView in _orderVC.tableViews) {
        if (tableView.contentOffset.y <0) {
            return;
        }
    }
    //先拿到相对位置
    CGPoint p = [pan translationInView:pan.view];
    //头部视图当前的高度
    CGFloat height = _headerView.bounds.size.height;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            
            [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
                //判断高度
                if(p.y +height >= KHeaderViewHeightMax){
                    //设置约束
                    make.height.offset(KHeaderViewHeightMax);
                    
                }else if (p.y +height <= KHeaderViewHeightMin){
                    //设置约束
                    make.height.offset(KHeaderViewHeightMin);
                    
                }else{
                    
                    make.height.offset(p.y +height);
                }
            }];
            
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            CGFloat shopHeaderViewMiddelHeight = (KHeaderViewHeightMax - KHeaderViewHeightMin) * 0.5 +KHeaderViewHeightMin;
            
            [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.headerView.bounds.size.height>shopHeaderViewMiddelHeight) {
                    make.height.offset(KHeaderViewHeightMax);
                }else{
                    make.height.offset(KHeaderViewHeightMin);
                }
            }];
            
            [UIView animateWithDuration:0.25 animations:^{
                [self.view setNeedsLayout];
            }];
        }
            break;
        default:
            break;
    }
    
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
#pragma mark - 设置滚动视图的联动(ScrollView代理)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算平移X值
    CGFloat transfromX = scrollView.contentOffset.x / scrollView.contentSize.width * _shopTagView.bounds.size.width;
    //让小黄条按比例平移
    _yellowView.transform = CGAffineTransformMakeTranslation(transfromX, 0);
    //判断小黄条位置,使其所在button字体加粗
    for (NSInteger i = 0; i < _shopTagView.subviews.count-1; i++) {
        if (_shopTagView.subviews[i].tag == scrollView.contentOffset.x/scrollView.bounds.size.width) {
            ((UIButton *)_shopTagView.subviews[i]).titleLabel.font = [UIFont boldSystemFontOfSize:14];
        }else{
            ((UIButton *)_shopTagView.subviews[i]).titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }
}
#pragma mark - 加载数据
-(void)loadShopControllerData{
    //创建一个路径
    NSURL *url = [[NSBundle mainBundle] URLForAuxiliaryExecutable:@"food.json"];
    //解析成nsdata
    NSData *data = [NSData dataWithContentsOfURL:url];
    //JSON
    NSDictionary *arr= [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *shopHeaderViewDict = arr[@"data"][@"poi_info"];
    //字典转模型
    shopHeaderViewModel *model= [shopHeaderViewModel shopHeaderVIewModelWithDict:shopHeaderViewDict];
    //保存数据
    _shopHeaderViewModel = model;
    
    
    //点餐界面数据
    NSArray *shopOrderArr = arr[@"data"][@"food_spu_tags"];
    
    NSMutableArray *shopOrderArrM = [NSMutableArray arrayWithCapacity:shopOrderArr.count];
    //遍历数组,字典转模型
    for (NSDictionary *dict in shopOrderArr) {
        ShopOrderModel *model = [ShopOrderModel shopOrderModelWithDict:dict];
        [shopOrderArrM addObject:model];
    }
    
    _shopOrderModel = shopOrderArrM;
    
    
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
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
