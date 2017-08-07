//
//  CreditEmployeeViewController.m
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "CreditEmployeeViewController.h"

@interface CreditEmployeeViewController ()

@end

@implementation CreditEmployeeViewController

@synthesize employeeNameField, departmentField, ageField;
@synthesize employeeDbUtil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.employeeDbUtil = [[EmployeeDbUtil alloc] init];
        [employeeDbUtil copyDataIfNotExisting];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Credit view controller loading...");
    //Set title of the navigation view
    [self.navigationItem setTitle:@"Employee Info"];
    //Create submit button in the navigation bar
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]
                               initWithTitle:@"Add"
                               style:UIBarButtonItemStylePlain
                               target:nil
                               action:@selector(saveEmployeeInfo:)];
    
    [self.navigationItem setRightBarButtonItem:addBtn];
}

-(void)saveEmployeeInfo: (id)sender{
    Employee* employee = [Employee new];
    employee.employeeName = self.employeeNameField.text;
    employee.department = self.departmentField.text;
    employee.age = [self.ageField.text integerValue];
    [employeeDbUtil saveEmployee:employee];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.toolbarHidden = YES;
    [super viewWillAppear:animated];
}

@end
