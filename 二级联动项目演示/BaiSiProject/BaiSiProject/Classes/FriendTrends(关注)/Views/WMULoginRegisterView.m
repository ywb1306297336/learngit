//
//  WMULoginRegisterView.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/4.
//

#import "WMULoginRegisterView.h"
@interface WMULoginRegisterView()
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterB;

@end
@implementation WMULoginRegisterView
- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage *btnImg = self.loginRegisterB.currentBackgroundImage;
    btnImg = [btnImg stretchableImageWithLeftCapWidth:btnImg.size.width * 0.5 topCapHeight:btnImg.size.height * 0.5];
    [self.loginRegisterB setBackgroundImage:btnImg forState:UIControlStateNormal];
}
+ (instancetype)loginView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
+ (instancetype)registerView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}
@end
