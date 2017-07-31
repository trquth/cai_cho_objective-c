//
//  CountryModel.h
//  cai_cho_ios
//
//  Created by mac on 7/31/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryModel : NSObject

@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* continent;
@property (nonatomic, strong) NSNumber* population;


-(id) initWithCode : (NSString*) _code withName: (NSString*) _name
      withContinent: (NSString*) _continent withPopulation: (NSNumber*) _population;
@end
