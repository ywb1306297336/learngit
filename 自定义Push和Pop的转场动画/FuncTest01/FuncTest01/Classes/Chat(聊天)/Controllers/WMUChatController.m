//
//  WMUChatController.m
//  Test01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUChatController.h"
#import "WMUGameController.h"
@interface WMUChatController ()
@end

@implementation WMUChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"聊天";
    self.view.backgroundColor = WMURandomColor;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"游戏大厅" fgNormal:WMUColor(81, 81, 81, 1.0) fgHighlighted:WMUColor(255, 81, 147, 1.0) fontSize:14 target:self action:@selector(didClickGameButton)];
}
#pragma mark - 监听
- (void)didClickGameButton {
    WMUGameController *gameC = [[WMUGameController alloc] init];
    gameC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:gameC animated:YES];
}
@end
