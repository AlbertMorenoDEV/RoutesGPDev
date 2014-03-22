//
//  NuevaRutaViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 20/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "NuevaRutaViewController.h"
#import "AppDelegate.h"

@interface NuevaRutaViewController () {
    AppDelegate *mAppDelegate;
}

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
    mAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *contexto = [mAppDelegate managedObjectContext];
    //NSManagedObject *nuevaRuta = [NSEntityDescription insertNewObjectForEntityForName:@"Ruta" inManagedObjectContext:contexto];
    Ruta *nuevaRuta = [NSEntityDescription insertNewObjectForEntityForName:@"Ruta" inManagedObjectContext:contexto];
    
    [nuevaRuta setValue:self.nombreTextField.text forKey:@"nombre"];
    [nuevaRuta setValue:self.descripcionTextView.text forKey:@"descripcion"];
    //[nuevaRuta setValue:self.self.fechaDatePicker.date forKey:@"fecha"];
    //[nuevaRuta setValue:self.nivelSegmentedControl.selectedSegmentIndex forKey:@"nivel"];
    
    self.nombreTextField.text = @"";
    self.descripcionTextView.text = @"";

//    para forzar el save en el simulador
    NSError *error;
    [contexto save:&error];
    
    if (error == nil)
    {
        NSLog(@"Ruta guardada");
        [self.nombreTextField becomeFirstResponder];
    }
    
    // Creamos el entity description
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Ruta" inManagedObjectContext:contexto];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    NSArray *objetosDevueltos = [contexto executeFetchRequest:request error:&error];
    if (objetosDevueltos.count==0) {
        NSLog(@"Sin resultados");
    } else {
        NSLog(@"%lu resultados", (unsigned long)[objetosDevueltos count]);
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelarPulsarBoton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
