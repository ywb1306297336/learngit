//
//  WMUPushAnimation.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/30.
//

#import "WMUPushAnimation.h"

@implementation WMUPushAnimation
static id _instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
+ (instancetype)sharePushAnimation {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .8f;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toV = nil;
    UIView *fromV = nil;
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        toV = [transitionContext viewForKey:UITransitionContextToViewKey];
        fromV = [transitionContext viewForKey:UITransitionContextFromViewKey];
    } else {
        toV = toVC.view;
        fromV = fromVC.view;
    }
    [[transitionContext containerView] addSubview:toV];
    toV.frame = CGRectMake(-WMUScreenW, 0, WMUScreenW, WMUScreenH);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toV.frame = CGRectMake(0, 0, WMUScreenW, WMUScreenH);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
}
@end
