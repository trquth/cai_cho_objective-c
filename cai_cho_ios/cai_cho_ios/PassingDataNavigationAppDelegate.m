//
//  PassingDataNavigationAppDelegate.m
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "PassingDataNavigationAppDelegate.h"
#import "FirstViewViewController.h"

@implementation PassingDataNavigationAppDelegate
@synthesize navigation, firstView;
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    navigation = [[UINavigationController alloc] init];
    [self.view addSubview: [self.navigation view]];
    
    if(self.firstView == nil){
        FirstViewViewController * firstViewController = [[FirstViewViewController alloc] init];
        self.firstView = firstViewController;
    }
    
    [self.navigation pushViewController: self.firstView animated:YES];
    
    self.window.backgroundColor =[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
