//
//  NavigationViewAppDelegate.h
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface NavigationViewAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong,nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController *navigationController;
@property (strong,nonatomic) UIViewController *homeViewController;

@end
