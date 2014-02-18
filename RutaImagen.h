//
//  RutaImagen.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 18/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ruta;

@interface RutaImagen : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * id_usuario;
@property (nonatomic, retain) NSString * imagen;
@property (nonatomic, retain) NSString * longitud;
@property (nonatomic, retain) NSString * latitud;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) Ruta *ruta;

@end
