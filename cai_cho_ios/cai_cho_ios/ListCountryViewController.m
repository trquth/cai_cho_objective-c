//
//  ListCountryViewController.m
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ListCountryViewController.h"

#define COUNTRY_TAG 1
#define CODE_TAG 2
#define CONTINENT_TAG 3
#define POPULATION_TAG 4

@interface ListCountryViewController ()

@end

@implementation ListCountryViewController

@synthesize countryList;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadCountryData];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.tableView];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CountryTableViewCell" bundle:nil] forCellReuseIdentifier:@"CountryCell"];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView*  headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    
    headerView.backgroundColor = [UIColor clearColor];
    if([tableView isEqual:self.tableView]){
        UILabel *result = [[UILabel alloc]
                           initWithFrame:CGRectMake(12, 0,
                                                    tableView.bounds.size.width, 30)];
        result.font = [UIFont boldSystemFontOfSize:16.0f];
        result.text = [NSString stringWithFormat:@"%@ :", @"List of Countries"];
        result.backgroundColor = [UIColor clearColor];
        [headerView addSubview:result];
    }
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat result = 0.0f;
    if ([tableView isEqual:self.tableView]){
        result = 35.0f;
    }
    return result;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%@",@"Called number of Rows in a Section");
    NSInteger numberOfRows = 0;
    
    if ([tableView isEqual:self.tableView]){
        numberOfRows = self.countryList.count;
    }
    return numberOfRows;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",@"Render cell at a given Index Path Section and Row");
    CountryTableViewCell *myCellView = nil;
    
    if ([tableView isEqual:self.tableView]){
        
        static NSString *TableViewCellIdentifier = @"CountryCell";
        
        //this method dequeues an existing cell if one is available or creates a new one
        //if no cell is available for reuse, this method returns nil
        myCellView = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
        if (myCellView == nil){
            //initialize the cell view from the xib file
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CountryCell"
                                                          owner:self options:nil];
            myCellView = (CountryTableViewCell *)[nibs objectAtIndex:0];
        }
        
        Country *country = [[Country alloc] init];
        country = [self.countryList objectAtIndex:indexPath.row];
        
        //populate data from your country object to table view cell
        myCellView.countryLbl.text = [NSString stringWithFormat:@"Name: %@",
                                        country.name];
        myCellView.codeLbl.text = [NSString stringWithFormat:@"Code: %@",
                                     country.code];
        myCellView.continentLbl.text = [NSString stringWithFormat:@"Continent: %@",
                                          country.continent];
        myCellView.poplationLbl.text = [NSString stringWithFormat:@"Population: %@",
                                           country.population];
//        [myCellView.detailInfoButton addTarget:self action:@selector(detailInfo:)
//                              forControlEvents:UIControlEventTouchUpInside];
        
    }
    return myCellView;
}


- (CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
//    CGFloat result = 20.0f;
//    if ([tableView isEqual:self.tableView]){
//        result = 100.0f;
//    }
//    return result;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) loadCountryData{
    NSMutableArray *array = [NSMutableArray new];
    self.countryList = array;
    
    Country *country = [[Country alloc] initWithCode:@"USA" withName:@"United States" withContinent:@"North American" withPopulation:[[NSNumber alloc] initWithInt:989898]];
    
    [countryList addObject:country];
    
    country = [[Country alloc] initWithCode:@"CAN" withName:@"Canada" withContinent:@"North American" withPopulation:[[NSNumber alloc] initWithInt:979797]];
    
    [countryList addObject:country];
    
    country = [[Country alloc] initWithCode:@"MXC" withName:@"Mexico" withContinent:@"North American" withPopulation:[[NSNumber alloc] initWithInt:969696]];
    
    [countryList addObject:country];
    
    country = [[Country alloc] initWithCode:@"VN" withName:@"VietNam" withContinent:@"Asia" withPopulation:[[NSNumber alloc] initWithInt: 959595]];

    [countryList addObject:country];
    
}

@end
