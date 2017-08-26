//
//  EmployeeRowTableViewCell.h
//  cai_cho_ios
//
//  Created by Thien Tran on 8/19/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeRowTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *deparmentLbl;
@property (weak, nonatomic) IBOutlet UILabel *ageLbl;

@end
