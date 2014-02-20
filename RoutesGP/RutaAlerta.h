//
//  RutaAlerta.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ruta;

@interface RutaAlerta : NSManagedObject

@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * id_usuario;
@property (nonatomic, retain) NSString * latitud;
@property (nonatomic, retain) NSString * longitud;
@property (nonatomic, retain) NSString * texto;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) Ruta *ruta;

@end
