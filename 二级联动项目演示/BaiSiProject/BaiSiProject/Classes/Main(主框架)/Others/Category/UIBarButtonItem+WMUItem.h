//
//  UIBarButtonItem+WMUItem.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (WMUItem)
+(instancetype)barButtomItemWithNormalBackgroundImage:(NSString *)norBgImg highlightedBackgroundImage:(NSString *)higBgImg target:(id)target action:(SEL)action;
+(instancetype)barButtomItemWithNormalBackgroundImage:(NSString *)norBgImg selectedBackgroundImage:(NSString *)selBgImg target:(id)target action:(SEL)action;
+(instancetype)barButtonItemWithTitle:(NSString *)title normalTitleColor:(UIColor *)norColor highlightedTitleColor:(UIColor *)higColor normalImage:(NSString *)norImg highlightedImage:(NSString *)higImg target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
