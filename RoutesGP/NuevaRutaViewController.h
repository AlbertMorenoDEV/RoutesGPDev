//
//  NuevaRutaViewController.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ruta.h"

@interface NuevaRutaViewController : UIViewController

@property (strong, nonatomic) Ruta *ruta;

@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;
@property (weak, nonatomic) IBOutlet UITextView *descripcionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *fechaDatePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *nivelSegmentedControl;

- (IBAction)guardarPulsarBoton:(id)sender;
- (IBAction)cancelarPulsarBoton:(id)sender;

@end
