//
//  WMUMainTabBarController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/7.
//

#import "WMUMainTabBarController.h"
#import "WMUBottomBarView.h"


@interface WMUMainTabBarController () <WMUBottomBarViewDelegate>

@end

@implementation WMUMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.加载子控制器
    [self loadSubControllers];
    //2.加载自定义底部tabBar
    WMUBottomBarView *bottomBar = [[WMUBottomBarView alloc] init];
    //设置代理
    bottomBar.delegate = self;
    //3.通过循环创建若干个底部的bottomBarButton(有几个子控制器就创建几个)
    for (int i = 0; i < self.viewControllers.count; i ++) {
        //拼接图片名称
        NSString *normal = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selected = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        //调用bottomBarView内部的方法来创建一个底部的按钮
        [bottomBar addBotttomBarButtonWithImage:normal selected:selected];
    }
    bottomBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:bottomBar];
}
//封装一个创建TabBarController的子控制器的方法
-(void)loadSubControllers {
    //加载5个storyboard中的导航控制器, 并且把这些导航控制器添加到self中
    //1.Hall: 购彩大厅
    UINavigationController *navHall = [self navigationControllerWithStoryboardName:@"WMUHall"];
    //2.Arena: 竞技场
    UINavigationController *navArena = [self navigationControllerWithStoryboardName:@"WMUArena"];
    //3.Discovery: 发现
    UINavigationController *navDiscovery = [self navigationControllerWithStoryboardName:@"WMUDiscovery"];
    //4.History: 开奖信息
    UINavigationController *navHistory = [self navigationControllerWithStoryboardName:@"WMUHistory"];
    //5.MyLottery: 我的彩票
    UINavigationController *navMyLottery = [self navigationControllerWithStoryboardName:@"WMUMyLottery"];
    //6.将上面这5个控制器添加到TabBarController中
    self.viewControllers = @[navHall, navArena, navDiscovery, navHistory, navMyLottery];
}
//封装一个根据storyboard文件创建控制器的方法
-(UINavigationController *)navigationControllerWithStoryboardName:(NSString *)name {
    //加载storyboard文件
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    //创建storyboard中的初始化控制器
    return [storyboard instantiateInitialViewController];
}
#pragma mark - <WMUBottomBarViewDelegate>
-(void)bottomBarView:(WMUBottomBarView *)bottomBarView didClickBottomBarButtonWithIndex:(int)idx {
    //通过TabBarController自己来切换显示控制器
    self.selectedIndex = idx;
}
@end
