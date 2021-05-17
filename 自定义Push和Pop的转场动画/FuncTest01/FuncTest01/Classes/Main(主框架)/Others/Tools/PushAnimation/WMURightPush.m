//
//  WMURightPush.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/15.
//

#import "WMURightPush.h"

@implementation WMURightPush
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
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
    toV.frame = CGRectMake(WMUScreenW, 0, WMUScreenW, WMUScreenH);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toV.frame = CGRectMake(0, 0, WMUScreenW, WMUScreenH);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
}
@end
