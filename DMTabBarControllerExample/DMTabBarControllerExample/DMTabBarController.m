//
//  DMTabBarController.m
//
//  Created by Daniel McCarthy on 10/13/14.
//  Copyright (c) 2014 Daniel McCarthy. All rights reserved.
//

#import "DMTabBarController.h"

@interface DMTabBarController ()

@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UIView *animatedSelector;

@end

@implementation DMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"cool");
    if (!self.selectorColor) {
        self.selectorColor = [UIColor colorWithRed:94.0f/255.0f green:214.0f/255.0f blue:248.0f/255.0f alpha:1.0f];
    }
    if (!self.barBackgroundColor) {
        self.barBackgroundColor = [UIColor colorWithRed:115.0f/255.0f green:115.0f/255.0f blue:115.0f/255.0f alpha:1.0f];
    }
    [self setupTheBgView];
    [self setupTheAnimatedSelector];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
}

#pragma mark - Setup Methods

- (void)setupTheBgView {
    self.bgView = [[UIView alloc] initWithFrame:self.tabBar.frame];
    self.bgView.backgroundColor = _barBackgroundColor;
    self.bgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tabBar.superview insertSubview:self.bgView atIndex:1];
    [self.tabBar setBackgroundImage:[UIImage new]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bgView
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.tabBar
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bgView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.tabBar
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bgView
                              attribute:NSLayoutAttributeTrailing
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.tabBar
                              attribute:NSLayoutAttributeTrailing
                              multiplier:1.0
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bgView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.tabBar
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
}

- (void)setupTheAnimatedSelector {
    self.animatedSelector = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _bgView.frame.size.width/self.viewControllers.count, _bgView.frame.size.height)];
    self.animatedSelector.backgroundColor = _selectorColor;
    [self.bgView addSubview:self.animatedSelector];
}

- (void)cancelNewPost {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - function methods

- (void)setSelectorColor:(UIColor *)selectorColor {
    _selectorColor = selectorColor;
    self.animatedSelector.backgroundColor = _selectorColor;
}

- (void)setBarBackgroundColor:(UIColor *)barBackgroundColor {
    _barBackgroundColor = barBackgroundColor;
    self.bgView.backgroundColor = _barBackgroundColor;
}

- (void)setDMTabBarHidden:(BOOL)hiddenValue {
    self.tabBar.hidden = hiddenValue;
    self.bgView.hidden = hiddenValue;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    int i = 0;
    for (UITabBarItem *theItem in self.tabBar.items) {
        i++;
        if (theItem == item) {
            [self animateSelectorForSlot:i];
            break;
        }
    }
}

- (void)animateSelectorForSlot:(NSInteger)slot {
    CGFloat itemWidth = _bgView.frame.size.width/self.viewControllers.count;
    CGFloat newCenterX = (itemWidth*slot)-(itemWidth/2);

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    self.animatedSelector.center = CGPointMake(newCenterX, self.bgView.frame.size.height/2);
    [UIView commitAnimations];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    CGFloat itemWidth = size.width/self.viewControllers.count;
    CGFloat newCenterX = (itemWidth*(self.selectedIndex+1))-(itemWidth/2);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    self.animatedSelector.frame = CGRectMake(_animatedSelector.frame.origin.x, _animatedSelector.frame.origin.y, itemWidth, _animatedSelector.frame.size.height);
    self.animatedSelector.center = CGPointMake(newCenterX, _animatedSelector.center.y);
    [UIView commitAnimations];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    CGFloat itemWidth;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        itemWidth = self.view.frame.size.height/self.viewControllers.count;
    }
    else {
        itemWidth = self.view.frame.size.width/self.viewControllers.count;
    }
    
    
    CGFloat newCenterX = (itemWidth*(self.selectedIndex+1))-(itemWidth/2);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    self.animatedSelector.frame = CGRectMake(_animatedSelector.frame.origin.x, _animatedSelector.frame.origin.y, itemWidth, _animatedSelector.frame.size.height);
    self.animatedSelector.center = CGPointMake(newCenterX, _animatedSelector.center.y);
    [UIView commitAnimations];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    [super setSelectedViewController:selectedViewController];
    /*[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    self.animatedSelector.center = button.center;
    [UIView commitAnimations];*/
}

@end
