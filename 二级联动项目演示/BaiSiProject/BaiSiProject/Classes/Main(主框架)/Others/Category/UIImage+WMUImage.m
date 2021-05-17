//
//  UIImage+WMUImage.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "UIImage+WMUImage.h"

@implementation UIImage (WMUImage)
+(UIImage *)imageWithOriginalImageNamed:(NSString *)imgName {
    UIImage *img = [UIImage imageNamed:imgName];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
