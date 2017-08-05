//
//  CRUDNavigationAppDetegate.m
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "CRUDNavigationAppDetegate.h"
#import "CreditCountryDataViewController.h"
#import "ListCountryDataViewController.h"

@implementation CRUDNavigationAppDetegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoodinator = _persistentStoreCoodinator;
@synthesize navigationController, creditCountryController, countryDataListController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // Initialize the screen
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    navigationController = [[UINavigationController alloc] init];
    [self.window addSubview:[self.navigationController view]];
    
    if(self.countryDataListController == nil){
        ListCountryDataViewController *countryListView = [[ListCountryDataViewController alloc]init];
        self.countryDataListController = countryListView;
    }
    
    [self.navigationController pushViewController:self.countryDataListController animated:YES];
    //Set background color and make your window visible
    self.window.backgroundColor = [UIColor whiteColor];
    //Make the new view controller as your root view controller
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSLog(@"%@",paths.firstObject);
    
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

#pragma mark - Core Data stack
// Returns the managed object context for application
// If the context doesn't aldready exits, it is created and bound to the persistend store coordinator for the application

- (NSManagedObjectContext*) managedObjectContext{
    if(_managedObjectModel != nil){
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoodinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        return _managedObjectContext;
    }
    return _managedObjectContext;
}

//Return the managed object model for the application
//If the model doesn't aldready exist, it is created from the application's model.

- (NSManagedObjectModel*) managedObjectModel{
    if (_managedObjectModel != nil) {
        return  _managedObjectModel;
    }
    
    NSURL* modelURL = [[NSBundle mainBundle] URLForResource:@"CountryDb" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator*) persistentStoreCoodinator{
    if (_persistentStoreCoodinator != nil) {
        return _persistentStoreCoodinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CountryDb.sqlite"];
    
    NSError* error =nil;
    _persistentStoreCoodinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoodinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolve error %@ %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoodinator;
}

#pragma mark -- Application's Documents directory
//Returns the URL to the application's Document directory
-(NSURL*) applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
