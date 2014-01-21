//
//  EjemploGpsViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 21/01/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "EjemploGpsViewController.h"

@interface EjemploGpsViewController ()

@end

@implementation EjemploGpsViewController

#pragma mark - Properties

@synthesize locationManager;

#pragma mark - Methods


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.locationManager == nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        self.locationManager.delegate = self;
    }
    [self.locationManager startUpdatingLocation];
    
    // 1. Get the current location
    
    CLLocation *curPos = locationManager.location;
    
    NSString *latitude = [[NSNumber numberWithDouble:curPos.coordinate.latitude] stringValue];
    
    NSString *longitude = [[NSNumber numberWithDouble:curPos.coordinate.longitude] stringValue];
    
    NSLog(@"Lat: %@", latitude);
    NSLog(@"Long: %@", longitude);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Turn off the location manager to save power.
    [self.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", @"Core location has a position.");
}
- (void) locationManager:(CLLocationManager *)manager
        didFailWithError:(NSError *)error
{
    NSLog(@"%@", @"Core location can't get a fix.");
}

@end
