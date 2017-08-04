//
//  CRUDNavigationAppDetegate.h
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreditCountryDataViewController;

@interface CRUDNavigationAppDetegate : UIResponder<UIApplicationDelegate>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UIWindow* window;
@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) CreditCountryDataViewController* creditCountryController;

-(void) saveContext;
-(NSURL*) applicationDocumentsDirectory;
@end

