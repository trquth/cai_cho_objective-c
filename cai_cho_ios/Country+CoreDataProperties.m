//
//  Country+CoreDataProperties.m
//  cai_cho_ios
//
//  Created by mac on 8/4/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Country+CoreDataProperties.h"

@implementation Country (CoreDataProperties)

+ (NSFetchRequest<Country *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Country"];
}

@dynamic code;
@dynamic name;
@dynamic continent;
@dynamic population;

@end
