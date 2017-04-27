//
//  WebController.h
//  cai_cho_ios
//
//  Created by admin on 4/27/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebController : UIViewController

@property (weak,nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *shortenBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shortLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clipBoardBtn;

- (IBAction) loadLocation:(id)sender;

@end
