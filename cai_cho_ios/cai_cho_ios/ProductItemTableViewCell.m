//
//  ProductItemTableViewCell.m
//  cai_cho_ios
//
//  Created by admin on 5/9/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ProductItemTableViewCell.h"

@implementation ProductItemTableViewCell

@synthesize nameLbl, priceLbl, thumbnailImage  ;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
