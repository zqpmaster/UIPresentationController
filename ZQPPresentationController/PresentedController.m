//
//  PresentedController.m
//  ZQPPresentationController
//
//  Created by ZQP on 15/6/20.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "PresentedController.h"
#import "CustomPresentationController.h"
#import "CustomTransition.h"

@interface PresentedController ()<UIViewControllerTransitioningDelegate>

@end

@implementation PresentedController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        [self setup];
    }
    
    return self;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self setup];

    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setup];
    }
    
    return self;

}

- (void)setup
{
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
{
    CustomTransition * transition = [[CustomTransition alloc] init];
    transition.isPresentation = YES;
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    CustomTransition * transition = [[CustomTransition alloc] init];
    transition.isPresentation = NO;
    return transition;
}
- (IBAction)dimissBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



@end
