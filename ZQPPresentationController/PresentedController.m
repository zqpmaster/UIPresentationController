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
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    
    return self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
{
    return [[CustomTransition alloc] init];
}

- (IBAction)dimissBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
