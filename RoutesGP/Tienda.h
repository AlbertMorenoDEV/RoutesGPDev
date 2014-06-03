//
//  Tienda.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 04/06/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Tienda : NSManagedObject

@property (nonatomic, retain) NSString * cp;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSDate * fechaRegistro;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * localizacion;
@property (nonatomic, retain) NSString * logotipo;
@property (nonatomic, retain) NSString * logotipoDos;
@property (nonatomic, retain) NSNumber * ofertasParaMoto;
@property (nonatomic, retain) NSNumber * ofertasParaMotorista;
@property (nonatomic, retain) NSNumber * ofertasParaRepuesto;
@property (nonatomic, retain) NSString * pais;
@property (nonatomic, retain) NSString * poblacion;
@property (nonatomic, retain) NSString * provincia;
@property (nonatomic, retain) NSString * telefono;
@property (nonatomic, retain) NSString * web;

@end
