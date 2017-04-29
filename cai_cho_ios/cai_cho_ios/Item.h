//
//  Item.h
//  cai_cho_ios
//
//  Created by admin on 4/27/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kWhatsitDidChangeNotification @"MyWhatsitDidChange"

@interface Item : NSObject

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *location;

- (id) initWithName: (NSString*) name location:(NSString*) location;

- (void) postDidChangeNotification;

@end
