//
//  WMULoginRegisterField.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/4.
//

#import "WMULoginRegisterField.h"

@implementation WMULoginRegisterField

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    self.placeholderColor = [UIColor grayColor];
    [self addTarget:self action:@selector(beginTextEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(endTextEditing) forControlEvents:UIControlEventEditingDidEnd];
}
//文本框开始编辑调用
- (void)beginTextEditing {
    self.placeholderColor = [UIColor whiteColor];
}
//文本框停止编辑调用
- (void)endTextEditing {
    self.placeholderColor = [UIColor grayColor];
}
@end
