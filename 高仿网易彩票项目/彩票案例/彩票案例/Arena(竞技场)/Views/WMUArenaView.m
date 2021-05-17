//
//  WMUArenaView.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/8.
//

#import "WMUArenaView.h"

@implementation WMUArenaView

- (void)drawRect:(CGRect)rect {
    UIImage *bgImg = [UIImage imageNamed:@"NLArenaBackground"];
    [bgImg drawInRect:rect];
}


@end
