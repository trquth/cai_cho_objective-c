//
//  ListEmployeesViewController.h
//  cai_cho_ios
//
//  Created by Thien Tran on 8/19/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "EmployeeDbUtil.h"

@interface ListEmployeesViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* employeeTableView ;
@property (strong, nonatomic)  NSMutableArray  *employeesList;

@property (nonatomic, strong) EmployeeDbUtil *employeeDbUtil;


@end
