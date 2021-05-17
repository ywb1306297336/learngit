//
//  WMUMyLotteryViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/11.
//

#import "WMUMyLotteryViewController.h"
#import "WMUSettingViewController.h"
#import "WMUQuestionListController.h"

@interface WMUMyLotteryViewController ()

@end

@implementation WMUMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击设置按钮
- (IBAction)didClickSettingButton:(UIBarButtonItem *)sender {
    //1.创建一个设置控制器
    WMUSettingViewController *settingVC = [[WMUSettingViewController alloc] init];
    //1.1设置控制器标题
    settingVC.navigationItem.title = @"设置";
    //1.2设置控制器右侧"常见问题"按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(didClickQuestionBtn)];
    //1.3赋值给导航栏右侧item
    settingVC.navigationItem.rightBarButtonItem = item;
    //指定plist文件名称
    settingVC.plistName = @"WMUSettingsIndex.plist";
    //2.把设置控制器push到当前导航控制器中
    [self.navigationController pushViewController:settingVC animated:YES];
}
//按钮点击监听方法
-(void)didClickQuestionBtn {
    //创建一个"常见问题列表"控制器
    WMUQuestionListController *questionVC = [[WMUQuestionListController alloc] init];
    questionVC.navigationItem.title = @"常见问题";
    //将该控制器push到导航控制器中
    [self.navigationController pushViewController:questionVC animated:YES];
}
@end
