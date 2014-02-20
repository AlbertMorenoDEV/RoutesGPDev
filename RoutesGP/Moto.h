//
//  Moto.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Moto : NSManagedObject

@property (nonatomic, retain) NSString * ano;
@property (nonatomic, retain) NSString * fabricante;
@property (nonatomic, retain) NSDate * fecha_registro;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * modelo;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSManagedObject *registros;

@end
