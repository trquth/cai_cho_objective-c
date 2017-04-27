//
//  Forcast.h
//  cai_cho_ios
//
//  Created by admin on 4/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface Forcast : NSObject<CLLocationManagerDelegate>
- (void) initLocationManager;
- (void) updateForcastData;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableDictionary *weatherReport;
@property  (strong, nonatomic) NSNumber *currentTemp;
@property (strong, nonatomic) NSNumber *currentHumidity;
@end
