//
//  WMUNavigationController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUNavigationController.h"

@interface WMUNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation WMUNavigationController

+ (void)load {
    UINavigationBar *bar = [UINavigationBar appearance];
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]};
    [bar setTitleTextAttributes:attrs];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
    //禁止之前的手势
    self.interactivePopGestureRecognizer.enabled = NO;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) { // 非根控制器
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"返回" normalTitleColor:[UIColor blackColor] highlightedTitleColor:WMUFg(255, 59, 48) normalImage:@"navigationButtonReturn" highlightedImage:@"navigationButtonReturnClick" target:self action:@selector(didClickBackButton)];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)didClickBackButton {
    [self popViewControllerAnimated:YES];
}
#pragma mark - 代理方法
//决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    return self.childViewControllers.count > 1;
    return NO;
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
