//
//  DMTabBarController.h
//
//  Created by Daniel McCarthy on 10/13/14.
//  Copyright (c) 2014 Daniel McCarthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMTabBarController : UITabBarController

@property (strong, nonatomic) UINavigationController *homeNav;
@property (strong, nonatomic) UIColor *selectorColor;
@property (strong, nonatomic) UIColor *barBackgroundColor;

- (void)setDMTabBarHidden:(BOOL)hiddenValue;
- (void)animateSelectorForSlot:(NSInteger)slot;

@end
