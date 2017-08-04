//
//  InputCountry.m
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "InputCountry.h"

@implementation InputCountry
-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame :frame];
    if(self) {
       self =  [[NSBundle mainBundle] loadNibNamed:@"InputCountry" owner:self options:nil].firstObject;
        // xong roi nhe!
    }
    return  self;
}


@end
