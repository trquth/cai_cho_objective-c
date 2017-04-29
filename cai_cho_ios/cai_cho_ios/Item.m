//
//  Item.m
//  cai_cho_ios
//
//  Created by admin on 4/27/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Item.h"

@implementation Item

- (void) postDidChangeNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kWhatsitDidChangeNotification object:self];
}

- (id) initWithName:  (NSString*) name location:(NSString*) location
{
    self = [super init];
    if (self) {
        self.name = name;
        self.location = location;
    }
    return self;
}



@end
