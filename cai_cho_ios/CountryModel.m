//
//  CountryModel.m
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "CountryModel.h"

@implementation CountryModel

@synthesize code;
@synthesize name;
@synthesize continent;
@synthesize population;

-(id) initWithCode:(NSString *) _code withName:(NSString *)_name withContinent:(NSString *)_continent withPopulation:(NSNumber *) _population{
    self = [super init];
    if (self) {
        self.code = _code;
        self.name = _name;
        self.continent = _continent;
        self.population = _population;
    }
    return self;
}


@end
