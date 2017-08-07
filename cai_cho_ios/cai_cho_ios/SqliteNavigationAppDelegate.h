//
//  SqliteNavigation.h
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CreditEmployeeViewController;

@interface SqliteNavigationAppDelegate : UIResponder<UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;
@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) CreditEmployeeViewController* creditEmployeeController;

@end
