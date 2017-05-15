//
//  ShopTableViewController.h
//  cai_cho_ios
//
//  Created by admin on 5/9/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) NSArray *descriptions;
@property (nonatomic, strong) NSArray *photos;

@end
