//
//  PassingDataNavigationAppDelegate.h
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "AppDelegate.h"
@class FirstViewViewController;

@interface PassingDataNavigationAppDelegate : UIResponder<UIApplicationDelegate>

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UINavigationController *navigation;
@property (strong, nonatomic) FirstViewViewController *firstView;

@end
