//
//  WMUTabBar.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUTabBar.h"
@interface WMUTabBar()
/** 发布按钮 */
@property (nonatomic, weak) UIButton *publishB;
@end
@implementation WMUTabBar
#pragma mark - 懒加载
-(UIButton *)publishB {
    if (!_publishB) {
        UIButton *publishB = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishB setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishB setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishB sizeToFit];
        [self addSubview:publishB];
        _publishB = publishB;
    }
    return _publishB;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.publishB.bounds = CGRectMake(0, 0, self.publishB.currentBackgroundImage.size.width, self.publishB.currentBackgroundImage.size.height);
    self.publishB.center = CGPointMake(self.wmu_width * 0.5, (self.wmu_height - self.safeAreaInsets.bottom) * 0.5);
    NSInteger count = self.items.count + 1;
    CGFloat btnW = self.wmu_width / count;
    CGFloat btnH = self.wmu_height - self.safeAreaInsets.bottom;
    CGFloat btnY = 0;
    NSInteger index = 0;
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishB) continue;
        CGFloat btnX = btnW * ((index > 1) ? (index + 1) : index);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        index ++;
    }
}
@end
