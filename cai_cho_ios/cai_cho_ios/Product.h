//
//  Product.h
//  cai_cho_ios
//
//  Created by admin on 5/9/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) NSArray *descriptions;
@property (nonatomic, strong) NSArray *photos;

- (void) loadData;

@end
