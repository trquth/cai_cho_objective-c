//
//  Country+CoreDataProperties.h
//  cai_cho_ios
//
//  Created by mac on 8/4/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Country+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Country (CoreDataProperties)

+ (NSFetchRequest<Country *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *continent;
@property (nonatomic) int64_t population;

@end

NS_ASSUME_NONNULL_END
