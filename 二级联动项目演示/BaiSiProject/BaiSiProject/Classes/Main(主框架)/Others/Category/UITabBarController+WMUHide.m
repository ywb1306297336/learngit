//
//  UITabBarController+WMUHide.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/30.
//

#import "UITabBarController+WMUHide.h"

@implementation UITabBarController (WMUHide)
-(void)tabBarHide:(BOOL)hide {
    if (hide) {
        self.tabBar.frame = CGRectMake(0, WMUScreenH - self.tabBar.height, self.tabBar.width, self.tabBar.height);
        [UIView animateWithDuration:0.8 animations:^{
            self.tabBar.frame = CGRectMake(WMUScreenW, WMUScreenH - self.tabBar.height, self.tabBar.width, self.tabBar.height);
        } completion:^(BOOL finished) {
            self.tabBar.alpha = 0;
        }];
    } else {
        self.tabBar.alpha = 1;
        self.tabBar.frame = CGRectMake(WMUScreenW, WMUScreenH - self.tabBar.height, self.tabBar.width, self.tabBar.height);
        [UIView animateWithDuration:0.8 animations:^{
            self.tabBar.frame = CGRectMake(0, WMUScreenH - self.tabBar.height, self.tabBar.width, self.tabBar.height);
        }];
    }
}
@end
