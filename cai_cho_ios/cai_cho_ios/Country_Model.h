//
//  Country.h
//  cai_cho_ios
//
//  Created by mac on 7/28/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country_Model : NSObject

@property (strong,  nonatomic) NSString* code;
@property (strong,  nonatomic) NSString* name;
@property (strong,  nonatomic) NSString* continent;
@property (strong,  nonatomic) NSNumber* population;

-(id) initWithCode: (NSString*) code
          withName:(NSString*) name
    withContinent :(NSString*) continent
    withPopulation: (NSNumber*) population;

@end
