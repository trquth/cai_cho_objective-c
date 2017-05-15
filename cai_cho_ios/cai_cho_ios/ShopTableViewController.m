//
//  ShopTableViewController.m
//  cai_cho_ios
//
//  Created by admin on 5/9/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ShopTableViewController.h"
#import "Product.h"
#import "ProductItemTableViewCell.h"

@interface ShopTableViewController ()

@end


@implementation ShopTableViewController

@synthesize names, prices, descriptions, photos;
- (void)viewDidLoad {
    [super viewDidLoad];
 
    Product *shop = [[Product alloc] init];
    [shop loadData];
    names = [[NSArray alloc] initWithArray: shop.names];
    prices = [[NSArray alloc] initWithArray: shop.prices];
    descriptions = [[NSArray alloc] initWithArray: shop.descriptions];
    photos = [[NSArray alloc] initWithArray: shop.photos];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [names count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentify = @"Cell";
    ProductItemTableViewCell *cell = (ProductItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIndentify forIndexPath:indexPath];
    
    
    cell.nameLbl.text = [NSString stringWithFormat:@"%@", [self.names objectAtIndex:indexPath.row]];
    cell.priceLbl.text = [NSString stringWithFormat:@"%@", [self.prices objectAtIndex:indexPath.row]];
    cell.thumbnailImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.photos objectAtIndex:indexPath.row]]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end
