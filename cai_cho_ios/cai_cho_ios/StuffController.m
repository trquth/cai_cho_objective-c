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

-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib{
    things = [@[
                [[Item alloc] initWithName:@"Gort" location:@"den"],
                [[Item alloc] initWithName:@"Disappearing TARDIS mug" location:@"kitchen"],
                [[Item alloc] initWithName:@"Robot USB drive" location:@"office"],
                [[Item alloc] initWithName:@"Sad Robot USB hub" location:@"office"],
                [[Item alloc] initWithName:@"Solar Powered Bunny" location:@"office"]
                ] mutableCopy];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(whatsitDidChangeNotification:) name:kWhatsitDidChangeNotification object:nil];
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
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

-(void)insertNewObject:(id)sender
{
    if (!things) {
        things = [[NSMutableArray alloc] init];
    }
    static unsigned int itemNumber = 1;
    NSString *newItemName = [NSString stringWithFormat:@"My Item %u", itemNumber++];
    Item *newItem = [[Item alloc] initWithName:newItemName location:nil];
    [things insertObject:newItem atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [things removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        
    }
}

-(void)whatsitDidChangeNotification:(NSNotification *)notification
{
    NSUInteger index = [things indexOfObject:notification.object];
    if (index != NSNotFound) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
    }
}
@end
