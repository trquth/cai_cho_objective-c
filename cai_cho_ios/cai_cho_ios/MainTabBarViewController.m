//
//  MainTabBarViewController.m
//  cai_cho_ios
//
//  Created by admin on 5/9/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor whiteColor] }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0f green:191/255.0f blue:234/255.0f alpha:1.0f] }
                                             forState:UIControlStateSelected];
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:248/255.0f green:191/255.0f blue:234/255.0f alpha:1.0f]];
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
