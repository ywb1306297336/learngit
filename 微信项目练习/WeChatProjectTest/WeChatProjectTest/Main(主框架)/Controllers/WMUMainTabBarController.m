//
//  WMUMainTabBarController.m
//  WeChatProjectTest
//
//  Created by 殷文博 on 2021/3/29.
//

#import "WMUMainTabBarController.h"
#import "WMUNavigationController.h"
#import "WMUMainFrameController.h"
#import "WMUContactsController.h"
#import "WMUDiscoverController.h"
#import "WMUMeController.h"

@interface WMUMainTabBarController ()

@end

@implementation WMUMainTabBarController
+(void)initialize {
    UITabBarItem *item = [UITabBarItem appearance];
    NSDictionary *attrs = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:12]};
    NSDictionary *selectedAttrs = @{NSForegroundColorAttributeName : [UIColor colorWithRed:134/255.0 green:219/255.0 blue:72/255.0 alpha:1.0], NSFontAttributeName : [UIFont systemFontOfSize:12]};
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubController:[[WMUMainFrameController alloc] init] title:@"微信" image:@"tabbar_mainframe" selected:@"tabbar_mainframeHL"];
    [self addSubController:[[WMUContactsController alloc] init] title:@"通讯录" image:@"tabbar_contacts" selected:@"tabbar_contactsHL"];
    [self addSubController:[[WMUDiscoverController alloc] init] title:@"发现" image:@"tabbar_discover" selected:@"tabbar_discoverHL"];
    [self addSubController:[[WMUMeController alloc] init] title:@"我" image:@"tabbar_me" selected:@"tabbar_meHL"];
}
-(void)addSubController:(UITableViewController *)subController title:(NSString *)title image:(NSString *)image selected:(NSString *)selected {
    subController.tabBarItem.title = title;
    subController.tabBarItem.image = [UIImage imageNamed:image];
    subController.tabBarItem.selectedImage = [UIImage imageNamed:selected];
    WMUNavigationController *nav = [[WMUNavigationController alloc] initWithRootViewController:subController];
    [self addChildViewController:nav];
}
@end
