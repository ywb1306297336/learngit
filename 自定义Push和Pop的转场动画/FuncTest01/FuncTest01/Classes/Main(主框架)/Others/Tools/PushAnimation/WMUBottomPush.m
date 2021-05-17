//
//  WMUBottomPush.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUBottomPush.h"

@implementation WMUBottomPush
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
    toV.frame = CGRectMake(0, -WMUScreenH, WMUScreenW, WMUScreenH);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toV.frame = CGRectMake(0, 0, WMUScreenW, WMUScreenH);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
}
@end
