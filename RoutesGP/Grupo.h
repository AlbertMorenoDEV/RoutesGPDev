//
//  Grupo.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 04/06/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GrupoUsuarios;

@interface Grupo : NSManagedObject

@property (nonatomic, retain) NSDate * fechaCreacion;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSSet *usuarios;
@end

@interface Grupo (CoreDataGeneratedAccessors)

- (void)addUsuariosObject:(GrupoUsuarios *)value;
- (void)removeUsuariosObject:(GrupoUsuarios *)value;
- (void)addUsuarios:(NSSet *)values;
- (void)removeUsuarios:(NSSet *)values;

@end
