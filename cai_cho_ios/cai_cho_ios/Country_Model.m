//
//  Country.m
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Country_Model.h"

@implementation Country_Model

@synthesize code;
@synthesize name;
@synthesize continent;
@synthesize population;

-(id) initWithCode:(NSString *)code withName:(NSString *)name withContinent:(NSString *)continent withPopulation:(NSNumber *)population{
    self = [super init];
    if (self) {
        self.code = code;
        self.name = name;
        self.continent = continent;
        self.population = population;
    }
    return  self;
}

@end
