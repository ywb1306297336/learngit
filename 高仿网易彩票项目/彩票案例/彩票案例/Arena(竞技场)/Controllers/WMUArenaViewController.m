//
//  WMUArenaViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/8.
//

#import "WMUArenaViewController.h"

@interface WMUArenaViewController ()
//分段控件
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation WMUArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置分段控件的背景图片
    [self.segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //2.设置按钮标题选中颜色
    NSMutableDictionary *dictNor = [NSMutableDictionary dictionary];
    NSMutableDictionary *dictSel = [NSMutableDictionary dictionary];
    dictNor[NSForegroundColorAttributeName] = [UIColor colorWithRed:18/255.0 green:141/255.0 blue:141/255.0 alpha:1.0];
    dictSel[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [self.segmentedControl setTitleTextAttributes:dictNor forState:UIControlStateNormal];
    [self.segmentedControl setTitleTextAttributes:dictSel forState:UIControlStateSelected];
    //3.设置默认选中
    [self.segmentedControl setSelectedSegmentIndex:0];
}


@end
