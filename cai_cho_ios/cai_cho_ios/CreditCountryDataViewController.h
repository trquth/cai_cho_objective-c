//
//  CreditCountryDataViewController.h
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country+CoreDataProperties.h"

@interface CreditCountryDataViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *continentField;
@property (weak, nonatomic) IBOutlet UITextField *populationField;

@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
