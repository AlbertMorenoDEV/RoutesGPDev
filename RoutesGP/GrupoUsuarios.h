//
//  GrupoUsuarios.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GrupoUsuarios : NSManagedObject

@property (nonatomic, retain) NSDate * fecha_creacion;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * id_usuario;
@property (nonatomic, retain) NSString * rol;
@property (nonatomic, retain) NSManagedObject *grupo;

@end
