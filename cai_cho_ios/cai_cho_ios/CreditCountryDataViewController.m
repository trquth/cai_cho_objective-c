//
//  CreditCountryDataViewController.m
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "CreditCountryDataViewController.h"
#import "CRUDNavigationAppDetegate.h"

@interface CreditCountryDataViewController ()
@property ( nonatomic ) NSManagedObjectContext *managedObjectContext;
@end

@implementation CreditCountryDataViewController

@synthesize codeField, nameField, continentField, populationField;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.managedObjectContext = [(CRUDNavigationAppDetegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    //Set the title of the navigation view
    [self.navigationItem setTitle:@"Country Infomation"];
    //Create a submit button in navigation bar
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(saveCountry:)];
    [self.navigationItem setRightBarButtonItem:saveBtn];
}

-(void) saveCountry: (id)sender{
    [self createNewCountry:self.codeField.text
                  withName:self.nameField.text
             withContinent:self.continentField.text
            withPopulation:[self.populationField.text intValue ]];
}

-(BOOL) createNewCountry:(NSString*) code withName: (NSString*) name
           withContinent:  (NSString*) continent withPopulation: (NSUInteger*) population{
    BOOL success = NO;
    Country *newCountry = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Country"
                          inManagedObjectContext:self.managedObjectContext];
    
    if(newCountry == nil){
        NSLog(@"Failed to create the new country");
        return success;
    }
    
    newCountry.code = code;
    newCountry.name = name;
    newCountry.continent = continent;
    newCountry.population = [NSNumber numberWithUnsignedInteger:population];
    
    NSError *savingError = nil;
    if([self.managedObjectContext save:&savingError]){
        NSLog(@"New country was created");
        success = YES;
        return success;
    }
    success = YES;
    return success;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.toolbarHidden = YES;
    [super viewWillAppear:animated];
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return self;
}


@end
