//
//  ZQPPresentationController.m
//  ZQPPresentationController
//
//  Created by ZQP on 15/6/20.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "CustomPresentationController.h"

@implementation CustomPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    if (self =[super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController])
    {
        _dimingView = [UIView new];
        _dimingView.backgroundColor = [UIColor blackColor];
        _dimingView.alpha = 0;
        [_dimingView setFrame:self.containerView.bounds];
    }
    
    return self;
}

- (void)presentationTransitionWillBegin
{
    [self.containerView insertSubview:self.self.dimingView atIndex:0];
    id <UIViewControllerTransitionCoordinator> coordinator = [self.presentedViewController transitionCoordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        _dimingView.alpha = 1;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
}

- (void)dismissalTransitionWillBegin
{
    id <UIViewControllerTransitionCoordinator> coordinator = [self.presentedViewController transitionCoordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        _dimingView.alpha = 0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];

}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    
}

-(CGRect)frameOfPresentedViewInContainerView
{
    CGRect frame = self.containerView.frame;
    return frame;
}

@end
