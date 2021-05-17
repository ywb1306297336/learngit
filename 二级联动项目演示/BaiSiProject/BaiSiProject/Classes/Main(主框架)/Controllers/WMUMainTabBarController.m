//
//  WMUMainTabBarController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUMainTabBarController.h"
#import "WMUEssenceController.h"
#import "WMUNewController.h"
#import "WMUFriendTrendsController.h"
#import "WMUMeController.h"
#import "WMUNavigationController.h"
#import "WMUTabBar.h"
@interface WMUMainTabBarController () 
/** 是否显示tabbar */
@property (nonatomic, assign) BOOL tabBarIsShow;
@end

@implementation WMUMainTabBarController

+ (void)load {
    UITabBarItem *item = [UITabBarItem appearance];
    NSDictionary *attrs = @{NSForegroundColorAttributeName : WMUFg(140, 132, 129), NSFontAttributeName : [UIFont systemFontOfSize:13]};
    NSDictionary *selAttrs = @{NSForegroundColorAttributeName: WMUFg(81, 81, 81)};
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewController:[WMUEssenceController new] title:@"精华" image:@"tabBar_essence_icon" selImage:@"tabBar_essence_click_icon"];
    [self setUpChildViewController:[WMUNewController new] title:@"新帖" image:@"tabBar_new_icon" selImage:@"tabBar_new_click_icon"];
    [self setUpChildViewController:[WMUFriendTrendsController new] title:@"关注" image:@"tabBar_friendTrends_icon" selImage:@"tabBar_friendTrends_click_icon"];
    [self setUpChildViewController:[self setUpStoryboardName:NSStringFromClass([WMUMeController class])] title:@"我" image:@"tabBar_me_icon" selImage:@"tabBar_me_click_icon"];
    [self setValue:[WMUTabBar tabBar] forKeyPath:@"tabBar"];
    [self setValue:WMUFg(81, 81, 81) forKeyPath:@"tabBar.tintColor"];
}
- (void)setUpChildViewController:(UIViewController *)cvc title:(NSString *)title image:(NSString *)img selImage:(NSString *)selImg {
    cvc.tabBarItem.title = title;
    cvc.tabBarItem.image = [UIImage imageWithOriginalImageNamed:img];
    cvc.tabBarItem.selectedImage = [UIImage imageWithOriginalImageNamed:selImg];
    WMUNavigationController *nav = [[WMUNavigationController alloc] initWithRootViewController:cvc];
    [self addChildViewController:nav];
}
- (UIViewController *)setUpStoryboardName:(NSString *)name {
    UIStoryboard *stortboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [stortboard instantiateInitialViewController];
}
@end
