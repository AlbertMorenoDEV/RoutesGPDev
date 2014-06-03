//
//  Moto.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 04/06/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GrupoUsuarios, MotoRegistro;

@interface Moto : NSManagedObject

@property (nonatomic, retain) NSString * alias;
@property (nonatomic, retain) NSString * ano;
@property (nonatomic, retain) NSString * fabricante;
@property (nonatomic, retain) NSDate * fechaRegistro;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * modelo;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) GrupoUsuarios *grupos;
@property (nonatomic, retain) NSSet *registros;
@end

@interface Moto (CoreDataGeneratedAccessors)

- (void)addRegistrosObject:(MotoRegistro *)value;
- (void)removeRegistrosObject:(MotoRegistro *)value;
- (void)addRegistros:(NSSet *)values;
- (void)removeRegistros:(NSSet *)values;

@end
