//
//  CountryItemTableViewCell.h
//  cai_cho_ios
//
//  Created by mac on 8/4/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *codeLbl;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *continentLbl;
@property (weak, nonatomic) IBOutlet UILabel *populationLbl;

@property (nonatomic) NSString *abc;
@end
