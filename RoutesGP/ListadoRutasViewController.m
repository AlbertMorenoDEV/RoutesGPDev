//
//  ListadoRutasViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 18/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "ListadoRutasViewController.h"
#import "DetalleRutaViewController.h"
#import "Ruta.h"
#import "AppDelegate.h"
#import "ListadoRutasCell.h"

@interface ListadoRutasViewController () {
    NSMutableArray *rgpRutasArray;
    AppDelegate *mAppDelegate;
    
}

@end

@implementation ListadoRutasViewController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    managedObjectContext = [mAppDelegate managedObjectContext];
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1); // Fail
    }
    
    self.title = @"Listado de Rutas";

//    rgpRutasArray = [[NSMutableArray alloc] init];
//    
//    // cargamos las rutas de la base de datos
//    
//    // Creamos el Managed Object Context
//    NSManagedObjectContext *contexto = [mAppDelegate managedObjectContext];
//    
//    // Creamos el entity description
//    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Ruta" inManagedObjectContext:contexto];
//    
//    // Creamos el fecth request
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:entityDescription];
//    
//    // Creamos la consulta
////    NSPredicate *consulta = [NSPredicate predicateWithFormat:@" nombre = %@ ",self.nombreTextField.text];
////    [request setPredicate:consulta];
//    
//    // Realizamos la consulta
//    NSError *error;
//    NSArray *objetosDevueltos = [contexto executeFetchRequest:request error:&error];
//    
//    // Mostramos las coincidencias si ha habido
//    if (objetosDevueltos.count==0) {
//        NSLog(@"Sin resultados");
//    } else {
//        NSLog(@"%lu resultados", (unsigned long)[objetosDevueltos count]);
//        
//        Ruta *ruta = [[Ruta alloc] init];
//        for (id objetoDevuelto in objetosDevueltos) {
//
//            ruta.nombre = [objetoDevuelto valueForKey:@"nombre"];
//            ruta.descripcion = [objetoDevuelto valueForKey:@"descripcion"];
//            ruta.fecha = [objetoDevuelto valueForKey:@"fecha"];
//            
//            [rgpRutasArray addObject:ruta];
//            
////            ruta = [[Ruta alloc] init];
//        }
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
//    self.fetchedResultsController = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (void)configureCell:(ListadoRutasCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Ruta *ruta = [_fetchedResultsController objectAtIndexPath:indexPath];
    cell.tag = indexPath.row;
    cell.nombreLabel.text = ruta.nombre;
    cell.descripcionTextView.text = ruta.descripcion;
}

- (ListadoRutasCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CeldaRuta";
    ListadoRutasCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"irDetalleRuta"])
    {
        DetalleRutaViewController *detalleRutaViewController = (DetalleRutaViewController *)segue.destinationViewController;
        
        //ListadoRutasCell *cell = (ListadoRutasCell *)sender;
        //detalleRutaViewController.ruta = [_fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathWithIndex:cell.tag]];
        detalleRutaViewController.ruta = [_fetchedResultsController objectAtIndexPath:[self.tableView indexPathForCell:sender]];
    }
    else if ([segue.identifier isEqualToString:@"irNuevaRuta"])
    {
        NuevaRutaViewController *nuevaRutaViewController = (NuevaRutaViewController *)segue.destinationViewController;
        nuevaRutaViewController.delegate = self;
    }
}

#pragma mark - NuevoContactoDelegate

- (void)nuevaRuta
{
    [self.tableView reloadData];
}

#pragma mark - NSFetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Ruta" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"fecha" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                                  managedObjectContext:managedObjectContext
                                                                                                    sectionNameKeyPath:nil
                                                                                                             cacheName:@"Root"];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}

/*
 Assume self has a property 'tableView' -- as is the case for an instance of a UITableViewController
 subclass -- and a method configureCell:atIndexPath: which updates the contents of a given cell
 with information from a managed object at the given index path in the fetched results controller.
 */

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    static NSString *CellIdentifier = @"CeldaRuta";
    ListadoRutasCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                             forIndexPath:indexPath];
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:cell
                    atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
