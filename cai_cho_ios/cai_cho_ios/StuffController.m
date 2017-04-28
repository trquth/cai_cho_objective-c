//
//  StuffController.m
//  cai_cho_ios
//
//  Created by admin on 4/27/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "StuffController.h"
#import "DetailStuffController.h"
#import "Item.h"

@interface StuffController (){\
    NSMutableArray *things;
}
@end

@implementation StuffController

- (void)awakeFromNib{
    things = [@[
                [[Item alloc] initWithName:@"Gort" location:@"den"],
                [[Item alloc] initWithName:@"Disappearing TARDIS mug" location:@"kitchen"],
                [[Item alloc] initWithName:@"Robot USB drive" location:@"office"],
                [[Item alloc] initWithName:@"Sad Robot USB hub" location:@"office"],
                [[Item alloc] initWithName:@"Solar Powered Bunny" location:@"office"]
                ] mutableCopy];
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return things.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Item *thing = things[indexPath.row];
    cell.textLabel.text = thing.name;
    cell.detailTextLabel.text =thing.location;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showStuffDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Item *object = things[indexPath.row];
        [[segue destinationViewController] setDetailItem: object];
    }
}



@end
