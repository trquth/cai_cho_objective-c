//
//  ProductCallAPI.h
//  cai_cho_ios
//
//  Created by admin on 5/3/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCallAPI : NSObject{
    NSData *response;
}

- (NSArray *) getAllProducts: (int) pageIndex  withPageSize: (int) pageSize;
@end
