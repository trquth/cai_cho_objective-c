//
//  Employee.h
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (nonatomic) NSInteger Id;
@property (strong, nonatomic) NSString* employeeName;
@property (strong, nonatomic) NSString* department;
@property (nonatomic) NSInteger age;

-(id) initWithId: (NSInteger *) Id withName: (NSString *) name
withDepartment:(NSString*) department withAge: (NSInteger *) age;

@end
