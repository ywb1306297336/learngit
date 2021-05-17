//
//  UITextField+WMUPlaceholder.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WMUPlaceholder)
@property UIColor *placeholderColor;
-(void)setWMU_placeholder:(NSString *)placeholder;
@end

NS_ASSUME_NONNULL_END
