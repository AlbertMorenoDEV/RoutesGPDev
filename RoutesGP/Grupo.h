//
//  Grupo.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GrupoUsuarios, Ruta;

@interface Grupo : NSManagedObject

@property (nonatomic, retain) NSDate * fecha_creacion;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) Ruta *rutas;
@property (nonatomic, retain) GrupoUsuarios *usuarios;

@end
