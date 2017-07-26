//
//  PrintStart.m
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "PrintStart.h"

@implementation PrintStart

-(void) PrintCharacter:(int)count withChar:(char)charToPrint{
    
    NSString* str ;
    for (int i = 0; i < count; i++) {
            str= @"";
        for (int j = 0; j < i; j++) {
            str = [str stringByAppendingFormat:@"%c",charToPrint];
        }
        NSLog(@"%@",str);
    }
    
}

@end
