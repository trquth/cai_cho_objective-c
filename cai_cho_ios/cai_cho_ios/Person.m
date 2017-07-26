//
//  Person.m
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Person.h"
#import "Common.h"

@implementation Person
-(int) getMonthOfDBO{
    NSDateFormatter* dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:DATE_FORMAT];
    NSString* dateString = [dateFormat stringFromDate:[self dayOfBirth]];

    
    return  [Common datePart:dateString withFormat:DATE_FORMAT withPart:@"Month"];
}

-(void) setDOBFromString:(NSString *)dataString{
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:DATE_FORMAT];
    [self setDayOfBirth:[formatter dateFromString:dataString]];
}

-(bool) containUser:(NSString *)searchUser{
    NSRange rangOfYourString = [[self userName] rangeOfString:searchUser];
    if (rangOfYourString.location == NSNotFound) {
        return  NO;
    }else{
        return  YES;
    }
}

@end
