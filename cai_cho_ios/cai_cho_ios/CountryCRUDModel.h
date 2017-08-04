//
//  CountryCRUDModel.h
//  cai_cho_ios
//
//  Created by mac on 8/1/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryCRUDModel : NSObject

@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* continent;
@property (strong, nonatomic) NSNumber* population;

@end
