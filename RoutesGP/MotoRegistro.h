//
//  MotoRegistro.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Moto;

@interface MotoRegistro : NSManagedObject

@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * texto;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) Moto *id_moto;

@end
