//
//  Person.h
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DATE_FORMAT @"dd/MM/yyyy"

@interface Person : NSObject

@property (nonatomic, assign) int userId;
@property (nonatomic, assign) NSString* userName;
@property (nonatomic, assign) NSData* dayOfBirth;

-(int) getMonthOfDBO;
-(void) setDOBFromString:(NSString*) dataString;
-(bool) containUser:(NSString*) searchUser;

@end
