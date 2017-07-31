//
//  CreditCountryNavigationAppDelegate.m
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "CreditCountryNavigationAppDelegate.h"
#import "CreditCountryViewController.h"

@implementation CreditCountryNavigationAppDelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.creditCountryController = [[CreditCountryViewController alloc]
                                    initWithNibName:@"CreditCountryViewController" bundle:nil];
    
    self.window.rootViewController = self.creditCountryController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return  YES;
}


@end
