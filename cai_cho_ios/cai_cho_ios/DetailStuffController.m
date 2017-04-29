//
//  DetailStuffController.m
//  cai_cho_ios
//
//  Created by admin on 4/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "DetailStuffController.h"

@interface DetailStuffController ()
@property (strong, nonatomic) UIPopoverController *stuffPopoverController;
- (void) configureView;
@end

@implementation DetailStuffController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDetailItem:(Item *) newDetailItem{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
    if (self.stuffPopoverController != nil) {
        [self.stuffPopoverController dismissPopoverAnimated:YES];
    }
}

-(void)configureView
{
    if (self.detailItem != nil) {
        self.nameField.text = self.detailItem.name;
        self.locationField.text = self.detailItem.location;
    }
}

-(IBAction)changedDetail:(id)sender
{
    if (sender == self.nameField) {
        self.detailItem.name = self.nameField.text;
    }else if (sender == self.locationField){
        self.detailItem.location = self.locationField.text;
    }
    [self.detailItem postDidChangeNotification];
}
@end
