//
//  WMUGuideCell.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/16.
//

#import "WMUGuideCell.h"
#import "WMUMainTabBarController.h"
@interface WMUGuideCell ()
@property (nonatomic, strong) UIImageView *imgViewBg;
@property (nonatomic, strong) UIButton *startBtn;
@end
@implementation WMUGuideCell
//懒加载
-(UIImageView *)imgViewBg {
    if (!_imgViewBg) {
        _imgViewBg = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgViewBg];
    }
    return _imgViewBg;
}
-(UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [[UIButton alloc] init];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [self.contentView addSubview:_startBtn];
        //为"立即体验"按钮添加点击事件
        [_startBtn addTarget:self action:@selector(clickStartBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imgViewBg.image = image;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.imgViewBg.frame = self.bounds;
    //设置"立即体验"按钮的frame
    CGFloat w = 161;
    CGFloat h = 40;
    CGFloat x = (self.bounds.size.width - w) * 0.5;
    CGFloat y = self.bounds.size.height * 0.9;
    self.startBtn.frame = CGRectMake(x, y, w, h);
}
-(void)setCellCount:(int)count currentCellIndex:(int)idx {
    if (idx == count - 1) {
        self.startBtn.hidden = NO;
    } else {
        self.startBtn.hidden = YES;
    }
}
//点击"立即体验"按钮
-(void)clickStartBtn {
    //1.创建一个主控制器
    WMUMainTabBarController *mainVC = [[WMUMainTabBarController alloc] init];
    //2.让window的根控制器跳转到主控制器
    self.window.rootViewController = mainVC;
}
@end
