//
//  CreditEmployeeViewController.h
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDbUtil.h"
#import "Employee.h"

@interface CreditEmployeeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *employeeNameField;
@property (weak, nonatomic) IBOutlet UITextField *departmentField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;

@property (strong, nonatomic) EmployeeDbUtil *employeeDbUtil;
@end
