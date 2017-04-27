//
//  WebController.m
//  cai_cho_ios
//
//  Created by admin on 4/27/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "WebController.h"

@interface WebController ()

@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

- (IBAction) loadLocation:(id)sender
{
    NSString *urlText = self.url.text;
    if (![urlText hasPrefix:@"http:"] && ![urlText hasPrefix:@"https:"]) {
        if ([urlText hasPrefix:@"//"]) {
            urlText = [@"//" stringByAppendingString: urlText];
            urlText = [@"http:" stringByAppendingString:urlText];
            
        }
    }
    NSURL *url = [NSURL URLWithString:urlText];
    [self.webView  loadRequest:[NSURLRequest requestWithURL:url]];
}
@end
