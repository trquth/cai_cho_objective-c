//
//  Common.m
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Common.h"

@implementation Common

+(NSString*) encodeXMLEntity:(NSString *)text{
    NSString* encode = [text stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    encode = [encode
              stringByReplacingOccurrencesOfString:@"<" withString:@"&gt;"];
    encode = [encode
              stringByReplacingOccurrencesOfString:@">" withString:@"&lt;"];
    encode = [encode
              stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"];
    encode = [encode
              stringByReplacingOccurrencesOfString:@"\'" withString:@"&apos;"];
    return  encode;
}

+(double) currentToDouble:(NSString *)currentValue{
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setLenient:true];
    NSNumber* doubleCurr = [formatter numberFromString:currentValue];
    
    return  [doubleCurr doubleValue];
}

+ (int) datePart:(NSString*) dateString withFormat:(NSString*) format withPart:(NSString*) part
{
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:format];
    
    NSDate *date = [dateFormat dateFromString:dateString];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar
                                    components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    int result;
    NSString* partWithUpperCase = [part uppercaseString];
    if ([partWithUpperCase isEqualToString:@"YEAR"])
    {
        result = [components year];
    }
    else if ([partWithUpperCase isEqualToString:@"MONTH"])
    {
        result = [components month];
    }
    else
    {
        result = [components day];
    }
    
    return result;
}


@end
