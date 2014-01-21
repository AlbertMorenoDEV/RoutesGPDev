//
//  EjemploGpsViewController.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 21/01/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface EjemploGpsViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;

@end
