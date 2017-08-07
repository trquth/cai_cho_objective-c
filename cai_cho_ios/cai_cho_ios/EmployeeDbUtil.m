//
//  EmployeeDbUtil.m
//  cai_cho_ios
//
//  Created by mac on 8/7/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "EmployeeDbUtil.h"

@implementation EmployeeDbUtil

@synthesize dbPath;

NSString* const dbName = @"demo.db";

//Init database
-(void) copyDataIfNotExisting{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError *error;
    dbPath = [self getPathDatabase];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    if (!success) {
        NSString* defaultDbPath = [[[NSBundle mainBundle] resourcePath]  stringByAppendingPathComponent:dbName];
        success = [fileManager copyItemAtPath:defaultDbPath toPath:dbPath error:&error];
        if (!success) {
            NSLog(@"Failed to create writable database file with message");
        }
    }
    
}

-(NSString*) getPathDatabase{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"Path -->%@",paths.firstObject);
    NSString* documentsDir = [paths objectAtIndex: 0];
    return [documentsDir stringByAppendingPathComponent:dbName];
}

//Save our data
-(BOOL)saveEmployee:(Employee *)employee{
    BOOL success = false;
    sqlite3_stmt *statement = NULL;
    const char *dbpath = [dbPath UTF8String];
    
    if (sqlite3_open(dbpath, &employeeSqlite) == SQLITE_OK) {
        NSLog(@"New data, Let insert");
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO EMPLOYEE(name, department, age) VALUES (\"%@\", \"%@\", \"%@\")",
                               employee.employeeName,
                               employee.department,
                               @(employee.age)];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(employeeSqlite, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            success = true;
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(employeeSqlite);
    }
    if (!success) {
        NSLog(@"Failed insert data");
    }
    return success;
}
//Get a list of all our employees
-(NSMutableArray *)getEmployees{
    NSMutableArray* listEmployees = [NSMutableArray new];
    const char *dbpath = [dbPath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &employeeSqlite) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            Employee* employee = [Employee new];
            employee.Id = sqlite3_column_int(statement, 0);
            employee.employeeName = [NSString stringWithUTF8String:(char *) sqlite3_column_int(statement, 1)] ;
            employee.department = [NSString stringWithUTF8String:(char *)sqlite3_column_int(statement, 2)] ;
            employee.age = sqlite3_column_int(statement, 3);
            [listEmployees addObject:employee];
            
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(statement);
    return listEmployees;
}

@end
