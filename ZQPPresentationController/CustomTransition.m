//
//  CustomTransition.m
//  ZQPPresentationController
//
//  Created by ZQP on 15/6/20.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "CustomTransition.h"

@implementation CustomTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    if (self.isPresentation) {
        [containerView addSubview:toView];
    }
    
    UIViewController *animatingViewController = self.isPresentation ? toViewController : fromViewController;
    UIView *animatingView = self.isPresentation ? toView : fromView;
    
    CGRect onScreenFrame = [transitionContext finalFrameForViewController:animatingViewController];
    CGRect offScreenFrame = CGRectOffset(onScreenFrame, 0, onScreenFrame.size.height);
    
    CGRect initialFrame = self.isPresentation ? offScreenFrame : onScreenFrame;
    CGRect finalFrame = self.isPresentation ? onScreenFrame : offScreenFrame;
    animatingView.frame = initialFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:300.0 initialSpringVelocity:5.0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^{
        animatingView.frame = finalFrame;
    } completion:^(BOOL finished) {
        if (!self.isPresentation) {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:YES];
    }];

}

@end
