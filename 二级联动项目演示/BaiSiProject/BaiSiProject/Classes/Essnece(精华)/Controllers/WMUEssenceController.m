//
//  WMUEssenceController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUEssenceController.h"
#import "WMUAllViewController.h"
#import "WMUVideoController.h"
#import "WMUMusicController.h"
#import "WMUPictureController.h"
#import "WMUWordController.h"
@interface WMUEssenceController () <UIScrollViewDelegate>
/** 标题栏 */
@property (nonatomic, weak) UIView *titleV;
/** 标题栏按钮 */
@property (nonatomic, weak) WMUTitleButton *titleB;
/** 标题栏下划线 */
@property (nonatomic, weak) UIView *titleUnderLine;
/** scrollView */
@property (nonatomic, weak) UIScrollView *scrollV;
@end

@implementation WMUEssenceController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WMUFg(220, 220, 221);
    [self setUpNavigationItem];
    //设置子控制器
    [self setUpChildControllers];
    //设置UIScrollView
    [self setUpScrollView];
    //设置TitleView
    [self setUpTitleView];
    //默认加载第一个子控制器的view
    [self addChildVCViewIntoScrollView:0];
}
#pragma mark - 初始化
- (void)setUpNavigationItem {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = imgView;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtomItemWithNormalBackgroundImage:@"nav_item_game_icon" highlightedBackgroundImage:@"nav_item_game_click_icon" target:self action:@selector(didClickGameButton)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtomItemWithNormalBackgroundImage:@"navigationButtonRandom" highlightedBackgroundImage:@"navigationButtonRandomClick" target:self action:@selector(didClickRandomButton)];
}
- (void)setUpChildControllers {
    [self addChildViewController:[[WMUAllViewController alloc] init]];
    [self addChildViewController:[[WMUVideoController alloc] init]];
    [self addChildViewController:[[WMUMusicController alloc] init]];
    [self addChildViewController:[[WMUPictureController alloc] init]];
    [self addChildViewController:[[WMUWordController alloc] init]];
}
- (void)setUpScrollView {
    UIScrollView *scrollV = [[UIScrollView alloc] init];
    //禁止自动修改UIScrollView的内边距
    scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollV.showsHorizontalScrollIndicator = NO;
    scrollV.showsVerticalScrollIndicator = NO;
    scrollV.pagingEnabled = YES;
    scrollV.frame = self.view.bounds;
    //设置代理
    scrollV.delegate = self;
    [self.view addSubview:scrollV];
    self.scrollV = scrollV;
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollVW = scrollV.width;
    scrollV.contentSize = CGSizeMake(count * scrollVW, 0);
}
- (void)setUpTitleView {
    UIView *titleV = [[UIView alloc] init];
    titleV.backgroundColor = WMUColor(255, 255, 255, 0.5);
    titleV.frame = CGRectMake(0, WMUNavigationBarHeight, self.view.width, WMUTitleViewHeight);
    [self.view addSubview:titleV];
    self.titleV  = titleV;
    //设置标题栏上的button
    [self setUpTitleButton];
    //设置标题栏上的下划线
    [self setUpTitleUnderLine];
}
- (void)setUpTitleButton {
    //标题字符串数组
    NSArray *titles = @[@"全部", @"看视频", @"听音乐", @"图片", @"段子"];
    NSInteger count = titles.count;
    CGFloat btnW = self.titleV.width / count;
    CGFloat btnH = self.titleV.height;
    CGFloat btnY = 0;
    for (NSInteger i = 0; i < count; i ++) {
        WMUTitleButton *titleB = [WMUTitleButton titleButton];
        //给按钮绑定tag值
        titleB.tag = i;
        CGFloat btnX = i * btnW;
        [titleB setTitle:titles[i] forState:UIControlStateNormal];
        [titleB addTarget:self action:@selector(didClickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        titleB.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [self.titleV addSubview:titleB];
    }
}
- (void)setUpTitleUnderLine {
    UIView *titleUnderLine = [[UIView alloc] init];
    titleUnderLine.height = 2;
    titleUnderLine.y = self.titleV.height - titleUnderLine.height;
    WMUTitleButton *firstTitleB = self.titleV.subviews.firstObject;
    //让下划线背景颜色和按钮选中状态的文字颜色一致
    titleUnderLine.backgroundColor = [firstTitleB titleColorForState:UIControlStateSelected];
    [self.titleV addSubview:titleUnderLine];
    self.titleUnderLine = titleUnderLine;
    //让按钮里的label根据文字内容计算尺寸
    [firstTitleB.titleLabel sizeToFit];
    firstTitleB.selected = YES;
    self.titleB = firstTitleB;
    self.titleUnderLine.width = firstTitleB.titleLabel.width + 10;
    self.titleUnderLine.centerX = firstTitleB.centerX;
}
#pragma mark - 监听
- (void)didClickTitleButton:(WMUTitleButton *)btn {
    self.titleB.selected = NO;
    btn.selected = YES;
    self.titleB = btn;
    NSUInteger index = btn.tag;
    CGFloat offsetX = index * self.scrollV.width;
    [UIView animateWithDuration:0.3 animations:^{
        //让下划线宽度和按钮上文字的宽度一致
//        self.titleUnderLine.width = [btn.currentTitle sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}].width;
        self.titleUnderLine.width = btn.titleLabel.width + 10;
        self.titleUnderLine.centerX = btn.centerX;
        self.scrollV.contentOffset = CGPointMake(offsetX, self.scrollV.contentOffset.y);
    } completion:^(BOOL finished) {
        [self addChildVCViewIntoScrollView:index];
    }];
}
- (void)didClickGameButton {
    WMUFunc;
}
- (void)didClickRandomButton {
    WMUFunc;
}
#pragma mark - <UIScrollViewDelegate>
//当用户松开scrollView并且滑动结束时调用这个代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //计算出标题按钮的索引
    NSUInteger index = scrollView.contentOffset.x / scrollView.width;
    //根据索引从titleView子控件数组中获取该按钮
    WMUTitleButton *titleB = self.titleV.subviews[index];
    //调用点击该按钮的方法
    [self didClickTitleButton:titleB];
}
//当用户松开scrollView的时候调用这个代理方法
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//}
#pragma mark -其他
- (void)addChildVCViewIntoScrollView:(NSUInteger)index {
    CGFloat width = self.scrollV.width;
    CGFloat height = self.scrollV.height;
    UIView *childVCView = self.childViewControllers[index].view;
    childVCView.frame = CGRectMake(index * width, 0, width, height);
    [self.scrollV addSubview:childVCView];
}
@end
