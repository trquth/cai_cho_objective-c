//
//  CreditCountryViewController.m
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "CreditCountryViewController.h"
#import "InputCountry.h"

@interface CreditCountryViewController ()

@end

@implementation CreditCountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    InputCountry* inputCountryView = [[InputCountry alloc] init];
    [self.view addSubview:inputCountryView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
