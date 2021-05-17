//
//  WMUMainTabBarController.m
//  Test01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUMainTabBarController.h"
#import "WMUChatController.h"
#import "WMUContactsController.h"
#import "WMUDiscoverController.h"
#import "WMUMeController.h"
#import "WMUNavigationController.h"
#import "WMUTabBar.h"
@interface WMUMainTabBarController ()

@end

@implementation WMUMainTabBarController

+ (void)initialize {
    UITabBarItem *item = [UITabBarItem appearance];
    NSDictionary *attrs = @{NSForegroundColorAttributeName : WMUColor(138, 142, 146, 1.0), NSFontAttributeName : [UIFont systemFontOfSize:13]};
    NSDictionary *selAttrs = @{NSForegroundColorAttributeName : WMUColor(134, 219, 72, 1.0), NSFontAttributeName : attrs[NSFontAttributeName]};
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildVC:[WMUChatController new] title:@"聊天" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
    [self setUpChildVC:[WMUContactsController new] title:@"联系人" image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
    [self setUpChildVC:[WMUDiscoverController new] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
    [self setUpChildVC:[WMUMeController new] title:@"我" image:@"tabbar_me" selectedImage:@"tabbar_meHL"];
    [self setValue:[[WMUTabBar alloc] init] forKeyPath:@"tabBar"];
    [self setValue:WMUColor(134, 219, 72, 1.0) forKeyPath:@"tabBar.tintColor"];
}
- (void)setUpChildVC:(UIViewController *)cvc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    cvc.tabBarItem.title = title;
    cvc.tabBarItem.image = [UIImage imageNamed:image];
    cvc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    WMUNavigationController *nav = [[WMUNavigationController alloc] initWithRootViewController:cvc];
    [self addChildViewController:nav];
}
@end
