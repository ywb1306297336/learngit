//
//  UITabBarController+WMUHide.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "UITabBarController+WMUHide.h"

@implementation UITabBarController (WMUHide)
-(void)tabBarHide:(BOOL)hide time:(CGFloat)time offsetOrigin:(CGPoint)origin {
    if (hide) {
        self.tabBar.frame = CGRectMake(0, WMUScreenH - self.tabBar.wmu_height, self.tabBar.wmu_width, self.tabBar.wmu_height);
        [UIView animateWithDuration:time animations:^{
                    self.tabBar.frame = CGRectMake(origin.x, origin.y, self.tabBar.wmu_width, self.tabBar.wmu_height);
                } completion:^(BOOL finished) {
                    self.tabBar.alpha = 0;
                }];
    } else {
        self.tabBar.alpha = 1;
        self.tabBar.frame = CGRectMake(origin.x, origin.y, self.tabBar.wmu_width, self.tabBar.wmu_height);
        [UIView animateWithDuration:time animations:^{
                    self.tabBar.frame = CGRectMake(0, WMUScreenH - self.tabBar.wmu_height, self.tabBar.wmu_width, self.tabBar.wmu_height);
        }];
    }
}
@end
