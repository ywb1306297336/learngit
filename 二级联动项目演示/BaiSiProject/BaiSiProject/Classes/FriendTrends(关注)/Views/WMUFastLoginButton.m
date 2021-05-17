//
//  WMUFastLoginButton.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/4.
//

#import "WMUFastLoginButton.h"

@implementation WMUFastLoginButton

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    self.titleLabel.y = self.height - self.titleLabel.height;
    [self.titleLabel sizeToFit];
    self.titleLabel.centerX = self.width * 0.5;
}

@end
