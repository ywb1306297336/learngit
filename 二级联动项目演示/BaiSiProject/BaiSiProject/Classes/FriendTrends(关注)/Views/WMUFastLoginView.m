//
//  WMUFastLoginView.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/4.
//

#import "WMUFastLoginView.h"

@implementation WMUFastLoginView

+(instancetype)fastLoginView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
