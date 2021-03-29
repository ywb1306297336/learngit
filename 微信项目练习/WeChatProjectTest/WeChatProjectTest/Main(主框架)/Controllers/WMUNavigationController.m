//
//  WMUNavigationController.m
//  WeChatProjectTest
//
//  Created by 殷文博 on 2021/3/29.
//

#import "WMUNavigationController.h"

@interface WMUNavigationController ()

@end

@implementation WMUNavigationController
+(void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    NSDictionary * attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:20]};
    [bar setTitleTextAttributes:attrs];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
