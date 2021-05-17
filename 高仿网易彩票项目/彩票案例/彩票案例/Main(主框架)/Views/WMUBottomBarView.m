//
//  WMUBottomBarView.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/7.
//

#import "WMUBottomBarView.h"
#import "WMUTabBarButton.h"
@interface WMUBottomBarView ()
@property (nonatomic, weak) UIButton *selectedBtn;
@end
@implementation WMUBottomBarView
-(void)addBotttomBarButtonWithImage:(NSString *)normal selected:(NSString *)selected {
    //1.创建一个按钮
    WMUTabBarButton *button = [[WMUTabBarButton alloc] init];
    //2.给按钮设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    //3.按钮注册点击事件
    [button addTarget:self action:@selector(didClickBottomBarButton:) forControlEvents:UIControlEventTouchDown];
    //4.把按钮添加到底部bottomBar(self)中
    [self addSubview:button];
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width / self.subviews.count;
    CGFloat h = self.bounds.size.height;
    CGFloat y = 0;
    for (int i = 0; i < self.subviews.count; i ++) {
        CGFloat x = i * w;
        UIButton *button = self.subviews[i];
        //为每个button绑定tag值
        button.tag = i;
        button.frame = CGRectMake(x, y, w, h);
        //如果是第一个的话, 就选中
        if (i == 0) {
            button.selected = YES;
            self.selectedBtn = button;
        }
    }
}
//底部按钮点击事件
-(void)didClickBottomBarButton:(UIButton *)btn {
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    //1.获取当前点击按钮的索引
    int idx = (int)btn.tag;
    //2.根据当前点击按钮的索引, 切换TabBar控制器中, 当前显示的子控制器
    if ([self.delegate respondsToSelector:@selector(bottomBarView:didClickBottomBarButtonWithIndex:)]) {
        [self.delegate bottomBarView:self didClickBottomBarButtonWithIndex:idx];
    }
}
@end
