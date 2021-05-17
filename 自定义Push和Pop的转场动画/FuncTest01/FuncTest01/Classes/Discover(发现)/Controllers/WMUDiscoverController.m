//
//  WMUDiscoverController.m
//  Test01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUDiscoverController.h"
#import "WMUTestTwoController.h"
#import "WMUTestThreeController.h"
@interface WMUDiscoverController () <UINavigationControllerDelegate>

@end

@implementation WMUDiscoverController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    self.view.backgroundColor = WMURandomColor;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"左" fgNormal:WMUColor(81, 81, 81, 1.0) fgHighlighted:WMUColor(255, 81, 147, 1.0) fontSize:17 target:self action:@selector(didClickLeftButton)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"右" fgNormal:WMUColor(81, 81, 81, 1.0) fgHighlighted:WMUColor(255, 81, 147, 1.0) fontSize:17 target:self action:@selector(didClickRightButton)];
}
#pragma mark - 监听
- (void)didClickLeftButton {
    WMUTestTwoController *testTC = [[WMUTestTwoController alloc] init];
    [self.navigationController pushViewController:testTC animated:YES];
}
- (void)didClickRightButton {
    WMUTestThreeController *testTrC = [[WMUTestThreeController alloc] init];
    [self.navigationController pushViewController:testTrC animated:YES];
}
#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        if ([toVC isKindOfClass:[WMUTestTwoController class]]) {
            return [[WMULeftPush alloc] init];
        } else if ([toVC isKindOfClass:[WMUTestThreeController class]]) {
            return [[WMURightPush alloc] init];
        }
    }
    return nil;
}
@end
