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
}

@end
