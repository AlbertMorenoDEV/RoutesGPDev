//
//  ListadoRutasViewController.h
//  RoutesGP
//
//  Created by albert moreno vendrell on 18/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NuevaRutaViewController.h"

@interface ListadoRutasViewController : UITableViewController <NuevaRutaDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
