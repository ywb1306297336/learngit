//
//  WMUFriendTrendsController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUFriendTrendsController.h"
#import "WMULoginRegisterController.h"
@interface WMUFriendTrendsController ()

@end

@implementation WMUFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WMUFg(220, 220, 221);
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtomItemWithNormalBackgroundImage:@"friendsRecommentIcon" highlightedBackgroundImage:@"friendsRecommentIcon-click" target:self action:@selector(didClickRecommentButton)];
}
- (void)didClickRecommentButton {
    WMUFunc;
}
- (IBAction)didClickLoginButton {
    WMULoginRegisterController *loginRC = [[WMULoginRegisterController alloc] init];
    [self presentViewController:loginRC animated:YES completion:nil];
}

@end
