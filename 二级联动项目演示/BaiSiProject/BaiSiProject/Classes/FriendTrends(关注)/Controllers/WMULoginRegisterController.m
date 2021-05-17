//
//  WMULoginRegisterController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/1.
//

#import "WMULoginRegisterController.h"
#import "WMULoginRegisterView.h"
#import "WMUFastLoginView.h"
@interface WMULoginRegisterController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadCons;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation WMULoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    WMULoginRegisterView *loginV = [WMULoginRegisterView loginView];
    [self.middleView addSubview:loginV];
    WMULoginRegisterView *registerV  = [WMULoginRegisterView registerView];
    [self.middleView addSubview:registerV];
    WMUFastLoginView *fastLoginV = [WMUFastLoginView fastLoginView];
    [self.bottomView addSubview:fastLoginV];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    WMULoginRegisterView *loginV = self.middleView.subviews[0];
    loginV.frame = CGRectMake(0, 0, self.middleView.width * 0.5, self.middleView.height);
    WMULoginRegisterView *registerV = self.middleView.subviews[1];
    registerV.frame = CGRectMake(self.middleView.width * 0.5, 0, self.middleView.width * 0.5, self.middleView.height);
    WMUFastLoginView *fastLoginV = self.bottomView.subviews.firstObject;
    fastLoginV.frame = self.bottomView.bounds;
}
- (IBAction)didClickCloseButton {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (IBAction)didClickRegistButton:(UIButton *)registB {
    registB.selected = !registB.selected;
    self.leadCons.constant = (self.leadCons.constant == 0 ? -self.middleView.width * 0.5 : 0);
    [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
    }];
}
//退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
