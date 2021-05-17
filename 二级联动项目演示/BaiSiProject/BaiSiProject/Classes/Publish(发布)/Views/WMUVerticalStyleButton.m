//
//  WMUVerticalStyleButton.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/13.
//

#import "WMUVerticalStyleButton.h"

@implementation WMUVerticalStyleButton

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
-(void)setUp {
    //文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}
-(void)layoutSubviews {
    [super layoutSubviews];
    //计算按钮图片的frame
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    //计算按钮文字的frame
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}
@end
