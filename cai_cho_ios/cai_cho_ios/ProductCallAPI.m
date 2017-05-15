//
//  ProductCallAPI.m
//  cai_cho_ios
//
//  Created by admin on 5/3/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ProductCallAPI.h"
#import "Constants.h"

@implementation ProductCallAPI
- (NSArray *) getAllProducts: (int) pageIndex  withPageSize: (int) pageSize
{
    NSArray *resultList;
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/catalogStandard/products?countryCode=%@&categoryId=%@&app_key=%@", ROOT_API ,@"US", @"23476", API_KEY];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
    if (!error) {
        resultList =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        //bool test = [[[resultList objectAtIndex:0] objectForKey:@"message"] isEqualToString: @"ok"];
        NSArray *dataxxx = [resultList objectAtIndex:0];
        bool abc = !resultList;
        if (!resultList && [[[resultList objectAtIndex:0] objectForKey:@"message"] isEqualToString: @"ok"]) {
            NSMutableArray *productsList = [[resultList objectAtIndex:1] objectForKey:@"result"];
            if (!productsList) {
                NSMutableArray *data = [[productsList objectAtIndex: 3] objectForKey:@"products"];
                for (int i = 0; data.count; i++) {
                    
                }
            }
            
        }
//        for (int i = 0; resultList.count; i++) {
//            NSString *ID = [[resultList objectAtIndex:i] objectForKey:@"id"];
//        }
        
    }
    return products;
}

@end
