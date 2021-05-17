//
//  WMUNewController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUNewController.h"
#import "WMUApp.h"
#import "WMUTagSubController.h"
#import "WMUAllNewController.h"
#import "WMUVideoNewController.h"
#import "WMUMusicNewController.h"
#import "WMUPictureNewController.h"
#import "WMUWordNewController.h"
@interface WMUNewController () <UINavigationControllerDelegate, UIScrollViewDelegate>
/** scrollV */
@property (nonatomic, weak) UIScrollView *scrollV;
/** 标题栏 */
@property (nonatomic, weak) UIView *titleV;
/** 标题按钮 */
@property (nonatomic, weak) UIButton *titleB;
/** 标题下划线 */
@property (nonatomic, weak) UIView *titleUnderLine;
@end

@implementation WMUNewController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WMUFg(220, 220, 221);
    [self setUpNavigationItem];
    [self setUpChildViewControllers];
    [self setUpScrollView];
    [self setUpTitleView];
    //默认加载第一个子控制器的view
    [self addChildVCViewIntoScrollView:0];
}
#pragma mark - 初始化
- (void)setUpNavigationItem {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtomItemWithNormalBackgroundImage:@"MainTagSubIcon" highlightedBackgroundImage:@"MainTagSubIconClick" target:self action:@selector(didClickMainTagSubButton)];
}
- (void)setUpChildViewControllers {
    [self addChildViewController:[WMUAllNewController new]];
    [self addChildViewController:[WMUVideoNewController new]];
    [self addChildViewController:[WMUMusicNewController new]];
    [self addChildViewController:[WMUPictureNewController new]];
    [self addChildViewController:[WMUWordNewController new]];
}
- (void)setUpScrollView {
    UIScrollView *scrollV = [[UIScrollView alloc] init];
    scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollV.showsVerticalScrollIndicator = NO;
    scrollV.showsHorizontalScrollIndicator = NO;
    scrollV.pagingEnabled = YES;
    scrollV.delegate = self;
    scrollV.frame = self.view.bounds;
    [self.view addSubview:scrollV];
    self.scrollV = scrollV;
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollW = scrollV.width;
    scrollV.contentSize = CGSizeMake(scrollW * count, 0);
}
- (void)setUpTitleView {
    UIView *titleV = [[UIView alloc] init];
    titleV.backgroundColor = WMUColor(255, 255, 255, 0.5);
    titleV.frame = CGRectMake(0, WMUNavigationBarHeight, self.view.width, WMUTitleViewHeight);
    [self.view addSubview:titleV];
    self.titleV = titleV;
    [self setUpTitleButton];
    [self setUpTitleUnderLine];
}
- (void)setUpTitleButton {
    NSArray *titles = @[@"全部", @"视频", @"音乐", @"图片", @"段子"];
    NSInteger count = titles.count;
    CGFloat btnW = self.titleV.width / count;
    CGFloat btnH = self.titleV.height;
    for (NSInteger i = 0; i < count; i ++) {
        CGFloat btnX = btnW * i;
        WMUTitleButton *titleB = [WMUTitleButton titleButton];
        titleB.tag = i;
        [titleB setTitle:titles[i] forState:UIControlStateNormal];
        [titleB addTarget:self action:@selector(didClickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        titleB.frame = CGRectMake(btnX, 0, btnW, btnH);
        [self.titleV addSubview:titleB];
    }
}
- (void)setUpTitleUnderLine {
    UIView *titleUnderLine = [[UIView alloc] init];
    titleUnderLine.height = 2;
    titleUnderLine.y = self.titleV.height - titleUnderLine.height;
    WMUTitleButton *firstTitleB = self.titleV.subviews.firstObject;
    titleUnderLine.backgroundColor = [firstTitleB titleColorForState:UIControlStateSelected];
    [self.titleV addSubview:titleUnderLine];
    self.titleUnderLine = titleUnderLine;
    firstTitleB.selected = YES;
    [firstTitleB.titleLabel sizeToFit];
    titleUnderLine.width = firstTitleB.titleLabel.width + 10;
    titleUnderLine.centerX = firstTitleB.centerX;
}
#pragma mark - 监听
- (void)didClickTitleButton:(WMUTitleButton *)btn {
    self.titleB.selected = NO;
    btn.selected = YES;
    self.titleB = btn;
    NSUInteger index = btn.tag;
    CGFloat offsetX = self.scrollV.width * index;
    [UIView animateWithDuration:0.3 animations:^{
        self.titleUnderLine.width = btn.titleLabel.width + 10;
        self.titleUnderLine.centerX = btn.centerX;
        self.scrollV.contentOffset = CGPointMake(offsetX, self.scrollV.contentOffset.y);
    } completion:^(BOOL finished) {
        [self addChildVCViewIntoScrollView:index];
    }];
}
- (void)didClickMainTagSubButton {
    WMUTagSubController *tagSC = [[WMUTagSubController alloc] init];
    [self.navigationController pushViewController:tagSC animated:YES];
}
#pragma mark - 导航控制器代理方法
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [WMUPushAnimation sharePushAnimation];
    }
    return nil;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger index = scrollView.contentOffset.x / scrollView.width;
    WMUTitleButton *titleB = self.titleV.subviews[index];
    [self didClickTitleButton:titleB];
}
#pragma mark - 其他
- (void)addChildVCViewIntoScrollView:(NSUInteger)index {
    CGFloat width = self.scrollV.width;
    CGFloat height = self.scrollV.height;
    UIView *childVCView = self.childViewControllers[index].view;
    childVCView.frame = CGRectMake(index * width, 0, width, height);
    [self.scrollV addSubview:childVCView];
}
@end
