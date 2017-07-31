//
//  NavigationViewAppDelegate.m
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "NavigationViewAppDelegate.h"
#import "ListCountryViewController.h"

@implementation NavigationViewAppDelegate

@synthesize navigationController;
@synthesize homeViewController;

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    navigationController = [[UINavigationController alloc] init];
//    [self.window addSubview:[self.navigationController view]];
//    
//    if(self.homeViewController == nil){
//        HomeViewController *homeView = [[HomeViewController alloc]init];
//        self.homeViewController = homeView;
//    }
//    
//    [self.navigationController pushViewController:self.homeViewController animated:YES];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = navigationController;
//    [self.window makeKeyAndVisible];
//    return YES;
    
    //initialize the screen
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //initialize your view controller
    self.listContryController = [[ListCountryViewController alloc]            initWithNibName:@"ListCountryViewController" bundle:nil];
    
    //make the new view controller as your root view controller
    self.window.rootViewController = self.listContryController;
    //set background color and make your window visible
    self.window.backgroundColor = [UIColor whiteColor];
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
