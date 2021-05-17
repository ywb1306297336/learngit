//
//  WMUArenaNavigationController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/8.
//

#import "WMUArenaNavigationController.h"

@interface WMUArenaNavigationController ()

@end

@implementation WMUArenaNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"NLArenaNavBar64"];
    CGSize size = img.size;
    img = [img stretchableImageWithLeftCapWidth:size.width * 0.5 topCapHeight:size.height *0.5];
    [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}


@end
