//
//  WMUTitleButton.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/7.
//

#import "WMUTitleButton.h"

@implementation WMUTitleButton
//防止按钮高亮状态
- (void)setHighlighted:(BOOL)highlighted {
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:WMUFg(81, 81, 81) forState:UIControlStateNormal];
        [self setTitleColor:WMUFg(255, 59, 48) forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}
+ (instancetype)titleButton {
    return [[self alloc] init];
}
@end
