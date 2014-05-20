//
//  DetalleMotoViewController.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 24/03/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleMotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fabricanteLabel;
@property (weak, nonatomic) IBOutlet UILabel *modeloLabel;
@property (weak, nonatomic) IBOutlet UILabel *anoLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;

//imagenes
@property (weak, nonatomic) IBOutlet UIImageView *fotoMotoImg;
@property (weak, nonatomic) IBOutlet UIImageView *fotoLugarImg;




- (IBAction)desplazarViewMantenimiento:(id)sender;


@end
