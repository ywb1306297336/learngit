//
//  WMUAdController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/28.
//

#import "WMUAdController.h"
#import <AFNetworking/AFNetworking.h>
#import "WMUADItem.h"
#import <MJExtension/MJExtension.h>
#import <SDWebImage/SDWebImage.h>
#import "WMUMainTabBarController.h"

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface WMUAdController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
/** 广告图片 */
@property (nonatomic, weak) UIImageView *adView;
/** 模型对象属性 */
@property (nonatomic, strong) WMUADItem *item;
/** 定时器 */
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation WMUAdController
#pragma mark - 懒加载
-(UIImageView *)adView {
    if (!_adView) {
        UIImageView *adview = [[UIImageView alloc] init];
        [self.adContainView addSubview:adview];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAdView)];
        [adview addGestureRecognizer:tap];
        adview.userInteractionEnabled = YES;
        _adView = adview;
    }
    return _adView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.adContainView.backgroundColor = WMUColor(247, 247, 247, 0);
    [self setUpLaunchImage];
    [self loadAdData];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}
- (void)timeChange {
    //倒计时 3秒
    static int i = 3;
    NSString *timeStr = [NSString stringWithFormat:@"跳过 (%d)", i];
    [self.skipButton setTitle:timeStr forState:UIControlStateNormal];
    if (i == 0) {
        [self didClickSkipButton];
    }
    i --;
}
//轻点广告界面
- (void)didTapAdView {
    //跳转safari
    NSURL *url = [NSURL URLWithString:self.item.curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url options:@{} completionHandler:nil];
    }
}
//加载广告数据
- (void)loadAdData {
    //1.创建请求回话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    //3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
//        WMULog(@"%@", responseObject);
        //获取字典
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        //字典转模型
        self.item = [WMUADItem mj_objectWithKeyValues:adDict];
        //创建UIImageView展示广告图片
        CGFloat h = WMUScreenW / self.item.w * self.item.h;
        self.adContainView.height = h;
        self.adView.frame = CGRectMake(0, 0, WMUScreenW, h);
        [self.adView sd_setImageWithURL:[NSURL URLWithString:self.item.w_picurl]];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            WMULog(@"%@", error);
        }];
}
//点击跳过按钮
- (IBAction)didClickSkipButton {
    //销毁广告控制器进入主界面
    WMUMainTabBarController *mainVC = [[WMUMainTabBarController alloc] init];
    self.view.window.rootViewController = mainVC;
    //销毁定时器
    [self.timer invalidate];
}

//设置启动图片
- (void)setUpLaunchImage {
    if (iphoneXR) {
        self.launchImageView.image = [UIImage imageNamed:@"launchImage-XR"];
    } else if (iphone6P) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iphone6) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    } else if (iphone5) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h@2x"];
    } else if (iphone4) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700@2x"];
    }
}
@end
