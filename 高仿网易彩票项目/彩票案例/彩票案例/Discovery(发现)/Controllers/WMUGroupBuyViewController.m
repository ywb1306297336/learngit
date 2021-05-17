//
//  WMUGroupBuyViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/10.
//

#import "WMUGroupBuyViewController.h"

@interface WMUGroupBuyViewController ()
/** strong 表示需要使用控件时, 不先进行创建+赋值, 而是直接赋值 */
@property(nonatomic, strong)UIView *blueView;
@end

@implementation WMUGroupBuyViewController
#pragma mark - 懒加载
-(UIView *)blueView {
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = 0;
        CGFloat x = 0;
        CGFloat y = 90;
        _blueView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:_blueView];
    }
    return _blueView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickTitleButton:(UIButton *)btn {
    [self blueView];
    [UIView animateWithDuration:0.5 animations:^{
            //让按钮中的小黄三角形旋转
            btn.imageView.transform = CGAffineTransformRotate(btn.imageView.transform, M_PI);
            //显示或隐藏蓝色view
            if (self.blueView.height == 0) {
                self.blueView.height = 200;
            } else {
                self.blueView.height = 0;
            }
    }];
}


@end
