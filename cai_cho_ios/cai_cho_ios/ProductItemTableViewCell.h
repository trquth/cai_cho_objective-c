//
//  ProductItemTableViewCell.h
//  cai_cho_ios
//
//  Created by admin on 5/9/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductItemTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLbl;
@property (nonatomic, weak) IBOutlet UILabel *priceLbl;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImage;

@end
