//
//  UIBarButtonItem+WMUItem.h
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (WMUItem)
+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title fgNormal:(UIColor *)nor fgHighlighted:(UIColor *)hig fontSize:(CGFloat)size target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
