//
//  ListCountryDataViewController.h
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CountryItemTableViewCell.h"
@class  CreditCountryDataViewController;

@interface ListCountryDataViewController : UIViewController<UITableViewDelegate,
    UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) UITableView *countryTableView;
@property (nonatomic, strong) NSFetchedResultsController *countryFRC;
@property (nonatomic, strong) CreditCountryDataViewController *creditCountryDataController;

@end
