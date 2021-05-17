//
//  WMUContactsController.m
//  Test01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUContactsController.h"
#import "WMUTestOneController.h"
#import "WMUTestFourController.h"
@interface WMUContactsController () <UINavigationControllerDelegate>

@end

@implementation WMUContactsController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"联系人";
    self.view.backgroundColor = WMURandomColor;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"上" fgNormal:WMUColor(81, 81, 81, 1.0) fgHighlighted:WMUColor(255, 81, 147, 1.0) fontSize:17 target:self action:@selector(didClickUpButton)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"下" fgNormal:WMUColor(81, 81, 81, 1.0) fgHighlighted:WMUColor(255, 81, 147, 1.0) fontSize:17 target:self action:@selector(didClickDownButton)];
}
#pragma mark - 监听
- (void)didClickUpButton {
    WMUTestFourController *testFC = [[WMUTestFourController alloc] init];
    [self.navigationController pushViewController:testFC animated:YES];
}
- (void)didClickDownButton {
    WMUTestOneController *testOC = [[WMUTestOneController alloc] init];
    [self.navigationController pushViewController:testOC animated:YES];
}
#pragma mark - <UINavigationControllerDelegate>
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        if ([toVC isKindOfClass:[WMUTestFourController class]]) {
            return [[WMUTopPush alloc] init];
        } else if ([toVC isKindOfClass:[WMUTestOneController class]]) {
            return [[WMUBottomPush alloc] init];
        }
    }
    return nil;
}
@end
