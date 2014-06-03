//
//  GrupoUsuarios.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 04/06/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Grupo, Moto;

@interface GrupoUsuarios : NSManagedObject

@property (nonatomic, retain) NSString * alias;
@property (nonatomic, retain) NSDate * fechaCreacion;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * idUsuario;
@property (nonatomic, retain) NSString * rol;
@property (nonatomic, retain) Grupo *grupo;
@property (nonatomic, retain) Moto *moto;

@end
