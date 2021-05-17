//
//  WMUSettingAboutHeaderView.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/14.
//

#import "WMUSettingAboutHeaderView.h"

@implementation WMUSettingAboutHeaderView
+(instancetype)settingAboutHeaderView {
    return [[[NSBundle mainBundle] loadNibNamed:@"WMUSettingAboutHeaderView" owner:nil options:nil] lastObject];
}
@end
