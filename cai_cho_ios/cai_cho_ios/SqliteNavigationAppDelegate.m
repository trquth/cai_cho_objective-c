//
//  SqliteNavigation.m
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "SqliteNavigationAppDelegate.h"
#import "CreditEmployeeViewController.h"

@implementation SqliteNavigationAppDelegate

@synthesize navigationController, creditEmployeeController;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //Create  the navigation controller and add the controllers view to the window
    navigationController = [[UINavigationController alloc] init];
    navigationController.navigationBar.translucent = NO;
    [self.window addSubview:[self.navigationController view]];
    //If credit controller doesn't exist
    if (self.creditEmployeeController == nil) {
        CreditEmployeeViewController* addEmployeeController = [CreditEmployeeViewController new];
        self.creditEmployeeController = addEmployeeController;
    }
    //Push add view controller into the navigation view controller stack
    [self.navigationController pushViewController:self.creditEmployeeController animated:YES];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return  YES;
}


@end
