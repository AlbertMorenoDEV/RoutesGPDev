//
//  ListadoRutasCell.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListadoRutasCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *nivelImage;
@property (weak, nonatomic) IBOutlet UIImageView *imagenesImage;
@property (weak, nonatomic) IBOutlet UIImageView *comentariosImage;
@property (weak, nonatomic) IBOutlet UIProgressView *dificultadProgressView;
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UITextView *descripcionTextView;

@end
