//
//  UIBarButtonItem+WMUItem.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/28.
//

#import "UIBarButtonItem+WMUItem.h"

@implementation UIBarButtonItem (WMUItem)
+(instancetype)barButtomItemWithNormalBackgroundImage:(NSString *)norBgImg highlightedBackgroundImage:(NSString *)higBgImg target:(nonnull id)target action:(nonnull SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:norBgImg] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:higBgImg] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
+(instancetype)barButtomItemWithNormalBackgroundImage:(NSString *)norBgImg selectedBackgroundImage:(NSString *)selBgImg target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:norBgImg] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selBgImg] forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
+(instancetype)barButtonItemWithTitle:(NSString *)title normalTitleColor:(UIColor *)norColor highlightedTitleColor:(UIColor *)higColor normalImage:(NSString *)norImg highlightedImage:(NSString *)higImg target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:norColor forState:UIControlStateNormal];
    [btn setTitleColor:higColor forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:higImg]forState:UIControlStateHighlighted];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
