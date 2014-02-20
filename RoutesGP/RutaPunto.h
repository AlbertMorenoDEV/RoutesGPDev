//
//  RutaPunto.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ruta;

@interface RutaPunto : NSManagedObject

@property (nonatomic, retain) NSString * aceleracion;
@property (nonatomic, retain) NSString * calidad_gps;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * id_usuario;
@property (nonatomic, retain) NSString * inclinacion;
@property (nonatomic, retain) NSString * latitud;
@property (nonatomic, retain) NSString * longitud;
@property (nonatomic, retain) NSString * velocidad;
@property (nonatomic, retain) Ruta *ruta;

@end
