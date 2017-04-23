//
//  main.m
//  cai_cho_ios_beginner
//
//  Created by admin on 4/20/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//@interface Fraction : NSObject
//- (void) print;
//- (void) setNumerator: (int) n;
//- (void) setDenominator: (int) n;
//- (int) getNumberator;
//- (int) getDenominator;
//
//@end
//
//@implementation Fraction
//
//int numerator, denominator;
//- (void) print
//{
//    NSLog(@"%i/%i", numerator, denominator);
//}
//-(void) setNumerator:(int)n
//{
//    numerator = n;
//}
//-(void) setDenominator:(int)n
//{
//    denominator = n;
//}
//-(int) getNumberator
//{
//    return numerator;
//}
//-(int) getDenominator
//{
//    return denominator;
//}
//
//@end
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //int valua1, value2 , sum;
        //valua1 = 5;
        //value2 = 4;
        //sum = valua1 + value2;
        //NSLog(@"The tota: %i + %i = %i", valua1, value2, sum);
        
        Fraction *myFraction;
        
        myFraction = [Fraction alloc];
        myFraction = [myFraction init];
        
        myFraction = [[Fraction alloc] init];
        
        //        [myFraction setNumerator: 2];
        //        [myFraction setDenominator:3];
        //myFraction.numerator = 4;
        //myFraction.denominator = 5;
               [myFraction setTo: 6 : 9];
        [myFraction add: myFraction];
        
        NSLog(@"The result");
        [myFraction print];
        NSLog(@"Get numerator %i and get denominator %i", myFraction.numerator, myFraction.denominator);
    }
    return 0;
}
