//
//  DoneViewController.m
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "DoneViewController.h"

@interface DoneViewController ()

@end

@implementation DoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"My Last View"];
    
    //set the background color of the view
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    int i = 1;
    //display toolbar
    self.navigationController.toolbarHidden = NO;
    
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                  target:nil
                                  action:nil];
    
    UIBarButtonItem *hideNavigation = [[UIBarButtonItem alloc]
                                       initWithTitle:@"Hide Navigation"
                                       style: UIBarButtonItemStyleBordered
                                       target:self
                                       action:@selector(checkButtonClick:)];
    hideNavigation.tag = i++;
    
    UIBarButtonItem *removeViews = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Close Views"
                                    style: UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(checkButtonClick:)];
    removeViews.tag = i++;
    
    NSArray *items = [NSArray arrayWithObjects:hideNavigation, itemSpace, removeViews, nil];
    self.toolbarItems = items;
    
}


- (void) checkButtonClick:(id)sender {
    
    //get reference to the button that requested the action
    UIBarButtonItem *myButton = (UIBarButtonItem *)sender;
    NSLog(@"Clicked on one of the toolbar buttons");
    
    //check which button it is, if you have more than one button on the screen
    //you must check before taking necessary action
    switch (myButton.tag) {
            case 1:
            //hide the navigation bar
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            break;
            
            case 2:
            
        {
            //Get the current array of View Controllers
            NSArray *currentControllers = self.navigationController.viewControllers;
            
            //Create a mutable array out of this array
            NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
            
            //create an array set of interger indexes
            NSMutableIndexSet *indexes = [NSMutableIndexSet
                                          indexSetWithIndexesInRange:NSMakeRange(1, 2)];
            
            //Remove the objects from the controller array based on the indexes
            [newControllers removeObjectsAtIndexes:indexes];
            
            //Assign the manipulated array to the Navigation Controller with animation
            [self.navigationController setViewControllers:newControllers
                                                 animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
