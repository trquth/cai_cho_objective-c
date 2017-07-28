//
//  DetailViewController.m
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize doneViewController;

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
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"My Second View"];
    
    //set the background color of the view
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    //for button tags
    int i = 1;
    
    // Show toolbar
    self.navigationController.toolbarHidden = NO;
    
    //Blank space to add between other items
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                  target:nil
                                  action:nil];
    
    //bar button item is a button specialized for placement on a UIToolbar
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                   target:self
                                   action:@selector(checkButtonClick:)];
    editButton.tag = i++;
    
    UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                      target:self
                                      action:@selector(checkButtonClick:)];
    forwardButton.tag = i++;
    
    UIBarButtonItem *popView = [[UIBarButtonItem alloc]
                                initWithTitle:@"Pop this View"
                                style: UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(checkButtonClick:)];
    popView.tag = i++;
    
    //create an array of buttons
    NSArray *items = [NSArray arrayWithObjects:popView, editButton, itemSpace, forwardButton, nil];
    //add the buttons to the toolbar
    self.toolbarItems = items;
    
    
}

- (void) checkButtonClick:(id)sender {
    
    //get reference to the button that requested the action
    UIBarButtonItem *myButton = (UIBarButtonItem *)sender;
    NSLog(@"Clicked on one of the toolbar buttons");
    
    //check which button it is, if you have more than one button on the screen
    //you must check before taking necessary action
    switch (myButton.tag) {
            case 1: {
                //send an alert message
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Edit Button Click"
                                                                  message:@"You clicked on the Edit Button which basically does nothing"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:nil, nil];
                
                [message show];
            }
            break;
            
            case 2:
            
            //if the last view controller doesn't exists create it
            if(self.doneViewController == nil){
                DoneViewController *lastView = [[DoneViewController alloc] init];
                self.doneViewController = lastView;
            }
            
        {
            //customize the back button, you must set this before pushing the latest view into the stack
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle: @"Go Back"
                                                                           style: UIBarButtonItemStyleBordered
                                                                          target: nil
                                                                          action: nil];
            
            [self.navigationItem setBackBarButtonItem: backButton];
        }
            
            //tell the navigation controller to push a new view into the stack
            [self.navigationController pushViewController:self.doneViewController animated:YES];
            break;
            
            case 3:
            //pop the current view from the stack
            [self.navigationController popViewControllerAnimated:YES];
            
        default:
            break;
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    //display navigation bar
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //display toolbar
    self.navigationController.toolbarHidden = NO;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
