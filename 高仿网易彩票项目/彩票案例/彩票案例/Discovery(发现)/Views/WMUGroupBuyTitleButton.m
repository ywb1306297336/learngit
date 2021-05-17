//
//  WMUGroupBuyTitleButton.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/9.
//

#import "WMUGroupBuyTitleButton.h"

@implementation WMUGroupBuyTitleButton
-(void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width;
    /**
     修改Button里titleLabel的frame
     */
    //1.获取titleLabel的frame
//    CGRect titleLblFrame = self.titleLabel.frame;
//    //2.修改x值
//    titleLblFrame.origin.x = 0;
//    //3.重新赋值
//    self.titleLabel.frame = titleLblFrame;
//    /**
//     修改Button里图片框的frame
//     */
//    //1.获取图片框的frame
//    CGRect imgViewFrame = self.imageView.frame;
//    //2.修改x值
//    imgViewFrame.origin.x = titleLblFrame.size.width;
//    //3.重新赋值
//    self.imageView.frame = imgViewFrame;
}
@end
