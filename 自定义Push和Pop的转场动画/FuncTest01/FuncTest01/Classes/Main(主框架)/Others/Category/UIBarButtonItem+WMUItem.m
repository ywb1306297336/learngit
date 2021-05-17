//
//  UIBarButtonItem+WMUItem.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "UIBarButtonItem+WMUItem.h"

@implementation UIBarButtonItem (WMUItem)
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title fgNormal:(UIColor *)nor fgHighlighted:(UIColor *)hig fontSize:(CGFloat)size target:(id)target action:(nonnull SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:nor forState:UIControlStateNormal];
    [button setTitleColor:hig forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
