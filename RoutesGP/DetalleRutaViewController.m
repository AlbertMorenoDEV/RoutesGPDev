//
//  DetalleRutaViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 18/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "DetalleRutaViewController.h"

@interface DetalleRutaViewController ()

@end

@implementation DetalleRutaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.fechaLabel.text = self.ruta.fecha.accessibilityValue;
    self.nombreLabel.text = self.ruta.nombre;
    self.descripcionTextView.text = self.ruta.description;
}

- (IBAction)imagenesPulsarBoton:(id)sender
{
    
}

- (IBAction)comentariosPulsarBoton:(id)sender
{
    
}

- (IBAction)trackPulsarBoton:(id)sender
{
    
}

- (IBAction)inclinometroPulsarBoton:(id)sender
{
    
}
@end
