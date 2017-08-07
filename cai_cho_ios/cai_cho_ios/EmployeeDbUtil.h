//
//  EmployeeDbUtil.h
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Employee.h"

@interface EmployeeDbUtil : NSObject{
    sqlite3 *employeeSqlite;
}

@property (nonatomic, retain) NSString* dbPath;


-(void) copyDataIfNotExisting;
-(BOOL) saveEmployee: (Employee*) employee;

@end
