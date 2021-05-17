//
//  WMULuckyBetViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/10.
//

#import "WMULuckyBetViewController.h"

@interface WMULuckyBetViewController ()
//彩灯图片框
@property (weak, nonatomic) IBOutlet UIImageView *lightImgView;
/** 承装彩灯图片的数组 */
@property(nonatomic, strong)NSArray *lights;
@end

@implementation WMULuckyBetViewController
#pragma mark - 懒加载
-(NSArray *)lights {
    if (!_lights) {
        _lights = @[[UIImage imageNamed:@"lucky_entry_light0"], [UIImage imageNamed:@"lucky_entry_light1"]];
    }
    return _lights;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置彩灯动画
    //1.设置图片框要显示的图片
    self.lightImgView.animationImages = self.lights;
    //2.设置动画执行时间
    self.lightImgView.animationDuration = 0.5;
    //3.设置动画重复次数
    self.lightImgView.animationRepeatCount = 0;
    //4.启动动画
    [self.lightImgView startAnimating];
}

@end
