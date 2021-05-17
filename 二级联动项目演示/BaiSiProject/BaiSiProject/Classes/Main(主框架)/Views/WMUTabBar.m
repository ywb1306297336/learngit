//
//  WMUTabBar.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUTabBar.h"
#import "WMUPublishController.h"
@interface WMUTabBar()
/** 发布按钮 */
@property (nonatomic, weak) UIButton *publishB;
/** 上一次点击的按钮 */
@property (nonatomic, weak) UIControl *previousB;
@end
@implementation WMUTabBar

-(UIButton *)publishB {
    if (!_publishB) {
        UIButton *publishB = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishB setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishB setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishB sizeToFit];
        [publishB addTarget:self action:@selector(didClickPublishButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishB];
        _publishB = publishB;
    }
    return _publishB;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.publishB.center = CGPointMake(self.width * 0.5, self.height * 0.3);
    NSInteger count = self.items.count + 1;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height - self.safeAreaInsets.bottom;
    CGFloat btnY = 0;
    NSInteger index = 0;
    for (UIControl *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishB) continue;
        if (index == 0 && self.previousB == nil) {
            self.previousB = btn;
        }
        CGFloat btnX = btnW * ((index > 1) ? (index + 1) : index);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        index ++;
        [btn addTarget:self action:@selector(didClickTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)didClickTabBarButton:(UIControl *)btn {
    if (self.previousB == btn) {
        //发出通知, 告诉外界TabBarButton被重复点击了
       [[NSNotificationCenter defaultCenter] postNotificationName:WMUTabarButtonDidRepeatClickNotification object:nil];
    }
    self.previousB = btn;
}
+(instancetype)tabBar {
    return [[self alloc] init];
}
-(void)drawRect:(CGRect)rect {
    UIImage *bgImg = [UIImage imageNamed:@"tabbar-light"];
    [bgImg drawInRect:rect];
}
#pragma mark - 监听
-(void)didClickPublishButton {
    WMUPublishController *publishC = [[WMUPublishController alloc] init];
    [self.window.rootViewController presentViewController:publishC animated:YES completion:nil];
}
@end
