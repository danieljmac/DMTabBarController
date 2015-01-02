//
//  tabBarController.m
//  DMTabBarControllerExample
//
//  Created by Daniel McCarthy on 1/1/15.
//  Copyright (c) 2015 Daniel McCarthy. All rights reserved.
//

#import "tabBarController.h"

@interface tabBarController ()

@end

@implementation tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectorColor = [UIColor colorWithRed:84.0f/255.0f green:190.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.barBackgroundColor = [UIColor colorWithRed:115.0f/255.0f green:115.0f/255.0f blue:115.0f/255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
