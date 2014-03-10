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

@interface ListadoRutasViewController () {
    NSMutableArray *rgpRutasArray;
}

@end

@implementation ListadoRutasViewController

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

    rgpRutasArray = [[NSMutableArray alloc] init];
    
    // cargamos las rutas de la base de datos
    
    // Recuperamos el delegado
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    // Creamos el Managed Object Context
    NSManagedObjectContext *contexto = [appDelegate managedObjectContext];
    
    // Creamos el entity description
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Ruta" inManagedObjectContext:contexto];
    
    // Creamos el fecth request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // Creamos la consulta
//    NSPredicate *consulta = [NSPredicate predicateWithFormat:@" nombre = %@ ",self.nombreTextField.text];
//    [request setPredicate:consulta];
    
    // Realizamos la consulta
    NSError *error;
    NSArray *objetosDevueltos = [contexto executeFetchRequest:request error:&error];
    
    // Mostramos las coincidencias si ha habido
    if (objetosDevueltos.count==0) {
        NSLog(@"Sin resultados");
    } else {
        NSLog(@"%lu resultados", (unsigned long)[objetosDevueltos count]);
        
        Ruta *ruta = [[Ruta alloc] init];
        for (id objetoDevuelto in objetosDevueltos) {

            ruta.nombre = [objetoDevuelto valueForKey:@"nombre"];
            ruta.descripcion = [objetoDevuelto valueForKey:@"descripcion"];
            ruta.fecha = [objetoDevuelto valueForKey:@"fecha"];
            
            [rgpRutasArray addObject:ruta];
            
//            ruta = [[Ruta alloc] init];
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rgpRutasArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CeldaRuta";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Ruta *ruta = [rgpRutasArray  objectAtIndex:indexPath.row];
    
    cell.tag = indexPath.row;
    cell.textLabel.text = ruta.nombre;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"irDetalleRuta"])
    {
        DetalleRutaViewController *detalleRutaViewController = (DetalleRutaViewController *)segue.destinationViewController;
        
        UITableViewCell *cell = (UITableViewCell *)sender;
        detalleRutaViewController.ruta = [rgpRutasArray objectAtIndex:cell.tag];
    }
    else if ([segue.identifier isEqualToString:@"irNuevaRuta"])
    {
        NuevaRutaViewController *nuevaRutaViewController = (NuevaRutaViewController *)segue.destinationViewController;
        nuevaRutaViewController.delegate = self;
    }
}

#pragma mark - NuevoContactoDelegate

//- (void)nuevaRuta:(Ruta *)ruta
- (void)nuevaRuta
{
    // [rgpRutasArray addObject:ruta];
    
    [self.tableView reloadData];
}

@end
