//
//  UIView+WMUFrame.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "UIView+WMUFrame.h"

@implementation UIView (WMUFrame)
-(void)setWmu_width:(CGFloat)wmu_width {
    CGRect frame = self.frame;
    frame.size.width = wmu_width;
    self.frame = frame;
}
-(CGFloat)wmu_width {
    return self.frame.size.width;
}
-(void)setWmu_height:(CGFloat)wmu_height {
    CGRect frame = self.frame;
    frame.size.height = wmu_height;
    self.frame = frame;
}
-(CGFloat)wmu_height {
    return self.frame.size.height;
}
-(void)setWmu_x:(CGFloat)wmu_x {
    CGRect frame = self.frame;
    frame.origin.x = wmu_x;
    self.frame = frame;
}
-(CGFloat)wmu_x {
    return self.frame.origin.x;
}
-(void)setWmu_y:(CGFloat)wmu_y {
    CGRect frame = self.frame;
    frame.origin.y = wmu_y;
    self.frame = frame;
}
-(CGFloat)wmu_y {
    return self.frame.origin.y;
}
-(void)setWmu_size:(CGSize)wmu_size {
    CGRect frame = self.frame;
    frame.size = wmu_size;
    self.frame = frame;
}
-(CGSize)wmu_size {
    return self.frame.size;
}
-(void)setWmu_origin:(CGPoint)wmu_origin {
    CGRect frame = self.frame;
    frame.origin = wmu_origin;
    self.frame = frame;
}
-(CGPoint)wmu_origin {
    return self.frame.origin;
}
-(void)setWmu_center_x:(CGFloat)wmu_center_x {
    CGPoint center = self.center;
    center.x = wmu_center_x;
    self.center = center;
}
-(CGFloat)wmu_center_x {
    return self.center.x;
}
-(void)setWmu_center_y:(CGFloat)wmu_center_y {
    CGPoint center = self.center;
    center.y = wmu_center_y;
    self.center = center;
}
-(CGFloat)wmu_center_y {
    return self.center.y;
}
@end
