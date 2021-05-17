//
//  UITextField+WMUPlaceholder.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/4.
//

#import "UITextField+WMUPlaceholder.h"
#import <objc/message.h>
@implementation UITextField (WMUPlaceholder)
+(void)load {
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method setWMU_placeholderMethod = class_getInstanceMethod(self, @selector(setWMU_placeholder:));
    method_exchangeImplementations(setPlaceholderMethod, setWMU_placeholderMethod);
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor {
    //利用runtime给系统的类添加成员属性
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UILabel *lblPlaceholder = [self valueForKey:@"placeholderLabel"];
    lblPlaceholder.textColor = placeholderColor;
}
-(UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, @"laceholderColor");
}
-(void)setWMU_placeholder:(NSString *)placeholder {
    [self setWMU_placeholder:placeholder];
    self.placeholderColor = self.placeholderColor;
}
@end
