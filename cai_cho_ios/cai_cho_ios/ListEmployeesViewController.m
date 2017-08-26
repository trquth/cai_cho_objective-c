//
//  ListEmployeesViewController.m
//  cai_cho_ios
//
//  Created by Thien Tran on 8/19/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ListEmployeesViewController.h"
#import "Employee.h"
#import "EmployeeRowTableViewCell.h"

@interface ListEmployeesViewController ()

@end


@implementation ListEmployeesViewController

@synthesize employeeTableView, employeesList,employeeDbUtil;

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
    //Set the title of the navigation view
    [self.navigationItem setTitle:@"Employee List"] ;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //create the table view with a given style
    self.employeeTableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                          style:UITableViewStyleGrouped];
    //set the table view delegate  to the current so we can listen for events
    
    self.employeeTableView.delegate = self;
    
    //set the datasource for the table view to the current object
    self.employeeTableView.dataSource = self;
    
    //marke sure our table view resizes correctly
    self.employeeTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //add the table view to the main view
    [self.view addSubview:self.employeeTableView];
    
    
}

//Asks the delegate for a view object to display in the header of the specified
//section of the table view, display the continent name in the header view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    
    headerView.backgroundColor = [UIColor clearColor];
    
    if ([tableView isEqual:self.employeeTableView]) {
        UILabel *result = [[UILabel alloc]initWithFrame:CGRectMake(12,0, tableView.bounds.size.width, 30)];
        result.font = [UIFont boldSystemFontOfSize:16.0f];
        result.text = [NSString stringWithFormat:@"%@:",@"List of employees"];
        result.backgroundColor = [UIColor clearColor];
        [headerView addSubview:result];
    }
    return headerView;
}

//asks teh delegate for the height to use for teh header of a particular section
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat result = 0.0f;
    if ([tableView isEqual:self.employeeTableView]) {
        result = 35.0f;
    }
    return result;
}
//asks the data source to  return the number of rows in a given section of a table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%@",@"Called number of Row in a Section");
    NSInteger numberOfRow = 0;
    if ([tableView isEqual:self.employeeTableView]) {
        numberOfRow = self.employeesList.count;
    }
    return numberOfRow;
}
//asks the data source for a cell to insert in a particular location of the table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",@"Render cell at a given Index Path Section and Row");
    EmployeeRowTableViewCell *employeeRow = nil;
    if ([tableView isEqual:self.employeeTableView]) {
        static NSString *tableViewCellIdentifier = @"EmployeeRowTableViewCell";
        //this methd dequeues an existing cell if one is avalable or creates a new one
        //if no cell is available for reuse, this method return nil
        employeeRow = [employeeTableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
        if (employeeRow == nil) {
            //create a new cell
            //            employeeRow = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
            //initialize the cell view from the xib file
            NSArray* nibs = [[NSBundle mainBundle] loadNibNamed: tableViewCellIdentifier
                                                         owner:self options:nil];
            employeeRow = (EmployeeRowTableViewCell*) [nibs objectAtIndex:0];
        }
        //get the employee based on the index path section
        Employee *employee = [Employee new];
        employee = [self.employeesList objectAtIndex:indexPath.row];
        
        //display the employee name  in main lable of the cell
        employeeRow.nameLbl.text = [NSString stringWithFormat:@"%@",employee.employeeName];
        employeeRow.deparmentLbl.text = [NSString stringWithFormat:@"%@",employee.department];
        employeeRow.ageLbl.text = [NSString stringWithFormat:@"%i",employee.age];
    }
    return employeeRow;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat result  = 20.0f;
    if ([tableView isEqual:self.employeeTableView]) {
        result = 100.0f;
    }
    return result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loadEmployeeData{
    NSMutableArray *dummyData = [NSMutableArray new];
    self.employeesList = dummyData;
    
    Employee *employee = [[Employee alloc] initWithId:1 withName:@"Tran Quan Thien" withDepartment:@"Developer" withAge:24];
    [dummyData addObject:employee];
    
    employee = [[Employee alloc]initWithId:2 withName:@"Tran Quang Thuat" withDepartment:@"Student" withAge:13];
    [dummyData addObject:employee];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //get employee list
    self.employeesList = [employeeDbUtil getEmployees];
    //reload the data in the table view
    [self.employeeTableView reloadData];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
