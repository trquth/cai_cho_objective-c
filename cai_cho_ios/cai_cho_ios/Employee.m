//
//  Employee.m
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize Id, employeeName, department, age;

- (id)initWithId:(NSInteger *)Id withName:(NSString *)name withDepartment:(NSString *)department withAge:(NSInteger *)age{
    self = [super init];
    if(self){
        self.Id = Id;
        self.employeeName = name;
        self.department = department;
        self.age = age;
    }
    return  self;
}

@end
