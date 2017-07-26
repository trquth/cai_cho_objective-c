//
//  ViewController.h
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    int x;
    int y;
    NSString* name;
    
    NSMutableArray* listPerson ;
}

@property (nonatomic) int x;
@property (nonatomic, retain) NSString* name;

@end
