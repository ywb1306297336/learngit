//
//  WMUPublishController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUPublishController.h"
#import <POP.h>
//设置动画延迟时间
static CGFloat const WMUAnimationDelay = 0.1;
@interface WMUPublishController ()

@end

@implementation WMUPublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WMUColor(10, 10, 10, 0.9);
    //让控制器的view不能被点击
    self.view.userInteractionEnabled = NO;
    [self setUpSubviews];
}
- (void)setUpSubviews {
    NSArray *images = @[@"publish-video", @"publish-audio", @"publish-picture", @"publish-text", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发语音", @"发图片", @"发段子", @"审帖", @"离线下载"];
    //中间的6个按钮
    int maxCols = 3;
    CGFloat btnW = 72;
    CGFloat btnH = btnW + 30;
    CGFloat btnStartX = 20;
    CGFloat btnStartY = (WMUScreenH - 2 * btnH) * 0.5;
    CGFloat xMargin = (WMUScreenW - 2 * btnStartX - maxCols * btnW) / (maxCols - 1);
    for (int i = 0; i < images.count; i ++) {
        WMUVerticalStyleButton *btn = [[WMUVerticalStyleButton alloc] init];
        btn.tag = i;
        [btn addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        //设置按钮内容
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        //设置X\Y
        int row = i / maxCols;
        int col = i % maxCols;
        CGFloat btnX = btnStartX + col * (xMargin + btnW);
        CGFloat btnEndY = btnStartY + row * btnH;
        CGFloat btnBeginY = btnEndY - WMUScreenH;
        //添加pop动画效果
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.springBounciness = 15;
        anim.springSpeed = 15;
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnBeginY, btnW, btnH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
        anim.beginTime = CACurrentMediaTime() + WMUAnimationDelay * i;
        [btn pop_addAnimation:anim forKey:nil];
    }
    //添加标语
    UIImageView *sloganV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    sloganV.frame = CGRectMake(0, -sloganV.image.size.height, sloganV.image.size.width, sloganV.image.size.height);
    [self.view addSubview:sloganV];
    //添加pop动画效果
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.springBounciness = 10;
    anim.springSpeed = 5;
    CGFloat centerX = WMUScreenW * 0.5;
    CGFloat centerEndY = WMUScreenH * 0.2;
    CGFloat centerBeginY = centerEndY - WMUScreenH;
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerBeginY)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerEndY)];
    anim.beginTime = CACurrentMediaTime() + images.count * WMUAnimationDelay;
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            self.view.userInteractionEnabled = YES;
    }];
    [sloganV pop_addAnimation:anim forKey:nil];
}
#pragma mark - 监听
- (void)didClickButton:(WMUVerticalStyleButton *)btn {
    
}
@end
