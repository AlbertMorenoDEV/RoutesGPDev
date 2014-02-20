//
//  DetalleRutaViewController.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 18/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ruta.h"

@interface DetalleRutaViewController : UIViewController

@property (strong, nonatomic) Ruta *ruta;

@property (weak, nonatomic) IBOutlet UIImageView *imagenImage;
@property (weak, nonatomic) IBOutlet UILabel *fechaLabel;
@property (weak, nonatomic) IBOutlet UIImageView *valoracion1Image;
@property (weak, nonatomic) IBOutlet UIImageView *valoracion2Image;
@property (weak, nonatomic) IBOutlet UIImageView *valoracion3Image;
@property (weak, nonatomic) IBOutlet UIImageView *valoracion4Image;
@property (weak, nonatomic) IBOutlet UILabel *distanciaLabel;
@property (weak, nonatomic) IBOutlet UILabel *grupoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *comentariosImage;
@property (weak, nonatomic) IBOutlet UITextView *descripcionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imagenesImage;
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;

- (IBAction)imagenesPulsarBoton:(id)sender;
- (IBAction)comentariosPulsarBoton:(id)sender;
- (IBAction)trackPulsarBoton:(id)sender;
- (IBAction)inclinometroPulsarBoton:(id)sender;

@end
