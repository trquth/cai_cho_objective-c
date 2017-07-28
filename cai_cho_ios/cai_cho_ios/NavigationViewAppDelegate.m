//
//  NavigationViewAppDelegate.m
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "NavigationViewAppDelegate.h"

@implementation NavigationViewAppDelegate

@synthesize navigationController;
@synthesize homeViewController;

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    navigationController = [[UINavigationController alloc] init];
    self.window.rootViewController = navigationController;
    [self.window addSubview:[self.navigationController view]];
    
    if(self.homeViewController == nil){
        HomeViewController *homeView = [[HomeViewController alloc]init];
        self.homeViewController = homeView;
    }
    
    [self.navigationController pushViewController:self.homeViewController animated:YES];
    self.window.backgroundColor = [UIColor blueColor];
    
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //do nothing
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //do nothing
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //do nothing
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    //do nothing
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //do nothing
}
@end
