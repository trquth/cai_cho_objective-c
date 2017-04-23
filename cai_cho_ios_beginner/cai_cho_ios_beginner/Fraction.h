//
//  Fraction.h
//  cai_cho_ios_beginner
//
//  Created by admin on 4/20/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
- (void) print;
- (void) setNumerator: (int) n;
- (void) setDenominator: (int) n;
- (int) getNumerator;
- (int) getDenominator;

@property int numerator, denominator;
-(double) convertToNum;
-(void) setTo: (int) n : (int) d;

-(void) add: (Fraction * ) f;
@end
