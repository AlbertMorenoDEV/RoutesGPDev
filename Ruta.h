//
//  Ruta.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 18/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RutaAlerta, RutaComentario, RutaImagen, RutaPunto;

@interface Ruta : NSManagedObject

@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * id_usuario;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * nivel;
@property (nonatomic, retain) NSString * dificultad;
@property (nonatomic, retain) RutaAlerta *alertas;
@property (nonatomic, retain) RutaComentario *comentarios;
@property (nonatomic, retain) NSManagedObject *grupo;
@property (nonatomic, retain) RutaImagen *imagenes;
@property (nonatomic, retain) RutaPunto *puntos;

@end
