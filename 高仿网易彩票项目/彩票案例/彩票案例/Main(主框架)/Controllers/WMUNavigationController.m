//
//  WMUNavigationController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/9.
//

#import "WMUNavigationController.h"

@interface WMUNavigationController ()

@end

@implementation WMUNavigationController

+(void)initialize {
    //创建一个数组, 并存入控制器本身的类
    NSArray *navArr = [NSArray arrayWithObjects:[self class], nil];
    //1.获取导航栏外观代理对象
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:navArr];
    //2.统一设置外观效果
    //2.1设置导航栏背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //2.2设置导航控制器的颜色和字体大小
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:dictM];
    //修改返回按钮的文字颜色和UIBarButtonItem的渲染颜色
    [navBar setTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//拦截所有push的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //参数viewController就是即将push的控制器
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
