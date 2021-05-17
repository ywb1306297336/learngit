//
//  WMUNavigationController.m
//  Test01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUNavigationController.h"

@interface WMUNavigationController ()

@end

@implementation WMUNavigationController
+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:22]};
    [bar setTitleTextAttributes:attrs];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
