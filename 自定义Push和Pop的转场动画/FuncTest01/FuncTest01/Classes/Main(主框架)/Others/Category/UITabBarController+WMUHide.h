//
//  UITabBarController+WMUHide.h
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (WMUHide)
-(void)tabBarHide:(BOOL)hide time:(CGFloat)time offsetOrigin:(CGPoint)origin;
@end

NS_ASSUME_NONNULL_END
