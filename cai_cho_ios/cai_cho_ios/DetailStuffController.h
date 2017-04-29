//
//  DetailStuffController.h
//  cai_cho_ios
//
//  Created by admin on 4/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailStuffController : UIViewController

@property (weak, nonatomic) Item *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
-(IBAction)changedDetail:(id)sender;
@end
