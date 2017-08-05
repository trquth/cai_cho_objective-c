//
//  ListCountryDataViewController.m
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ListCountryDataViewController.h"
#import "CRUDNavigationAppDetegate.h"
#import "Country+CoreDataProperties.h"
#import "CreditCountryDataViewController.h"

@interface ListCountryDataViewController ()

@end

@implementation ListCountryDataViewController
@synthesize countryTableView, managedObjectContext, countryFRC, creditCountryDataController;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Get the application delegate and its managed object context
        if (self.managedObjectContext == nil) {
            CRUDNavigationAppDetegate *navigationDeletegateApp = (CRUDNavigationAppDetegate*) [[UIApplication sharedApplication ] delegate];
            self.managedObjectContext = navigationDeletegateApp.managedObjectContext;
        }
    }
    //Create the fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // Create reference to the Country entity
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Country" inManagedObjectContext:[self managedObjectContext]];
    //In what order you want your data to be fetched
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"code" ascending:YES];
    NSArray *sortDescriptions = [[NSArray alloc] initWithObjects:nameSort, nil];
    fetchRequest.sortDescriptors = sortDescriptions;
    
    // Tell the request that we want to read the contents of the Employee entity
    [fetchRequest setEntity:entity];
    // Initialize a fetched results controller to efficiently manage the results
    // Returned from a Core data fetch  request
    self.countryFRC = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                        managedObjectContext:[self managedObjectContext]
                                                          sectionNameKeyPath:nil cacheName:nil];
    //Notify the view controller when the fetched results change
    self.countryFRC.delegate = self;
    
    NSError *fetchingError = nil;
    //Perform the fetch request
    if ([self.countryFRC performFetch:&fetchingError]) {
        NSLog(@"Successfully fetched data from Country entity");
    }else{
        NSLog(@"Failed to fetch any data from Country entity");
    }
    return self;
};


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view from its nib.
    // Set the title of the navigation view
    [self.navigationItem setTitle:@"Country List"];
    // Create the table view with a given style
    self.view.backgroundColor = [UIColor blueColor];
    self.countryTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // Set table view delegate to the the current so we can listen for events
    self.countryTableView.delegate = self;
    // Set the datasource for the table view to the current object
    self.countryTableView.dataSource = self;
    
    // Make sure our table view resizes correctly
    self.countryTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //Add the right button in the navigation
    [self configureNavigation];
    // Add table view  to the main view
    [self.view addSubview:self.countryTableView];
    
}

// The number of rows in a given section of a table view
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.countryFRC.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

// Insert in a particular location of the  table view for a given section/row location
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",@"Render cell at a given Index Path Section and Row");
    
    CountryItemTableViewCell* cellView = nil;
    if ([countryTableView isEqual: self.countryTableView]) {
        static NSString* tableViewCellIdentifier = @"CountryCell";
        
        //this method dequeueres an existing cell if one is avaiable or creates a new one
        cellView = [countryTableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
        if (cellView == nil) {
            //Initialize the cell view from the xib file
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CountryItemTableViewCell" owner:self options:nil];
            cellView= (CountryItemTableViewCell*)[nibs objectAtIndex:0];
            
            Country* country = [self.countryFRC objectAtIndexPath:indexPath];
            
            //display text for the cell view
            cellView.codeLbl.text = [NSString stringWithFormat:@"%@", country.code];
            cellView.nameLbl.text = [NSString stringWithFormat:@"%@", country.name];
            cellView.continentLbl.text = [NSString stringWithFormat:@"%@", country.continent];
            cellView.populationLbl.text = [NSString stringWithFormat:@"%g", country.population];
        }
    }
    return cellView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat result = 40.0f;
    if ([tableView isEqual:self.countryTableView]) {
        result = 200.0f;
    }
    return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) configureNavigation{
    //Create a submit button in the navigation bar
    UIBarButtonItem *addBarBtn = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Add"
                                  style:UIBarButtonItemStylePlain
                                  target:self action:@selector(addCountry:)];
    [self.navigationItem setRightBarButtonItem:addBarBtn];
}

-(void) addCountry:(id)sender{
    //Get reference to the button that requested the action
    UIBarButtonItem *addBarBtn = (UIBarButtonItem*)sender;
    //Check which button it is, if you have more than one button on the screen
    //you must check before takinge necessary action
    if ([addBarBtn.title isEqualToString:@"Add"]) {
        NSLog(@"Clicked on the bar button");
        
        //If the edit view controller doen't exists create it
        if (self.creditCountryDataController == nil) {
            CreditCountryDataViewController *addCountryDataView = [[CreditCountryDataViewController alloc] init];
            self.creditCountryDataController = addCountryDataView;
        }
        //Pass the NSManagedObjectContext
        self.creditCountryDataController.managedObjectContext = self.managedObjectContext;
        //Tell the navigation controller to push a new view into the stack
        [self.navigationController pushViewController:self.creditCountryDataController animated:YES];
    }
}

-(void) editCountry : (NSIndexPath*) indexPath{
    //If the edit view controller doesn't exist create it
    if (self.creditCountryDataController == nil) {
        CreditCountryDataViewController *editCountryDataView = [[CreditCountryDataViewController alloc ] init];
        self.creditCountryDataController = editCountryDataView;
    }
    
    //pass the country code to the edit view controller
    Country *country = [self.countryFRC objectAtIndexPath:indexPath];
    NSManagedObjectID *countryCode = [country objectID];
    //[self.creditCountryDataController ]
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
