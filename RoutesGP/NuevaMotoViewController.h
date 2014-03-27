//
//  NuevaMotoViewController.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 14/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moto.h"

@interface NuevaMotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fabricanteTextField;
@property (weak, nonatomic) IBOutlet UITextField *modeloTextField;
@property (weak, nonatomic) IBOutlet UITextField *anoTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *tipoPickerView;

- (IBAction)guardarPulsarBoton:(id)sender;
- (IBAction)cancelarPulsarBoton:(id)sender;

@end
