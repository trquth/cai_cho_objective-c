//
//  Fraction.m
//  cai_cho_ios_beginner
//
//  Created by admin on 4/20/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "Fraction.h"
#include <math.h>

@implementation Fraction
//int numerator, denomatrator;
@synthesize numerator, denominator;
-(void) print
{
    NSLog(@"The franction : %i/%i", numerator, denominator);
}
-(void) setNumerator:(int)n
{
    numerator= n;
}
-(void) setDenominator:(int) n
{
    denominator = n;
}
-(int) getNumerator
{
    return numerator;
}
-(int) getDenominator
{
    return denominator;
}

-(double) convertToNum
{
    return denominator != 0 ? (double) numerator/ denominator : NAN;
    
}
-(void) setTo:(int) n : (int)d
{
numerator= n;
denominator= d;
}
-(void) add: (Fraction *) f
{
    numerator = numerator * f.numerator;
    denominator=denominator * f.denominator;
}
@end
