//
//  NuevaRutaViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "NuevaRutaViewController.h"
#import "AppDelegate.h"

@interface NuevaRutaViewController ()

@end

@implementation NuevaRutaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guardarPulsarBoton:(id)sender
{
    if (self.delegate != nil)
    {
//        Ruta *ruta = [[Ruta alloc] init];
//        
//        ruta.nombre = self.nombreTextField.text;
//        ruta.descripcion = self.descripcionTextView.text;
//        ruta.fecha = self.fechaDatePicker.date;
//        ruta.nivel = self.nivelSegmentedControl.selectedSegmentIndex;
        
//        [self.delegate nuevaRuta:ruta];
        [self.delegate nuevaRuta];
    }
    
    // Recuperamos el delegado
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    // Creamos el Managed Object Context
    NSManagedObjectContext *contexto = [appDelegate managedObjectContext];
    
    // Creamos la nueva ruta
    NSManagedObject *nuevaRuta;
    nuevaRuta = [NSEntityDescription insertNewObjectForEntityForName:@"Ruta" inManagedObjectContext:contexto];
    
    // Le damos los valores de la vista
    [nuevaRuta setValue:self.nombreTextField.text forKey:@"nombre"];
    [nuevaRuta setValue:self.descripcionTextView.text forKey:@"descripcion"];
    [nuevaRuta setValue:self.fechaDatePicker.date forKey:@"fecha"];
    
    // Guardamos
    NSError *error;
    [contexto save:&error];
    
    NSLog(@"Ruta guardada");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelarPulsarBoton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
