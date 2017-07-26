//
//  Common.h
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

+(NSString*)encodeXMLEntity:(NSString*) text;
+(double) currentToDouble:(NSString*) currentValue;
+(int)datePart:(NSString*)dateString withFormat: (NSString*) format withPart: (NSString*) part;

@end
