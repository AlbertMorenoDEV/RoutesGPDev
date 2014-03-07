//
//  MotoCorreViewController.h
//  RoutesGP
//
//  Created by ntl on 3/7/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MotoCorreViewController : UIViewController

{
    IBOutlet UIImageView *fondo;
    IBOutlet UIImageView *moto;
    IBOutlet UIImageView *startImagen;
    IBOutlet UIButton *start;
    
}

-(IBAction)start:(id)sender;


@end
