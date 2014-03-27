//
//  NuevaMotoViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 14/02/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "NuevaMotoViewController.h"
#import "AppDelegate.h"

@interface NuevaMotoViewController () {
    AppDelegate *mAppDelegate;
}

@end

@implementation NuevaMotoViewController

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
    Moto *nuevaMoto = [NSEntityDescription insertNewObjectForEntityForName:@"Moto" inManagedObjectContext:contexto];
    
    [nuevaMoto setValue:self.fabricanteTextField.text forKeyPath:@"fabricante"];
    [nuevaMoto setValue:self.modeloTextField.text forKeyPath:@"modelo"];
    [nuevaMoto setValue:self.anoTextField.text forKeyPath:@"ano"];
    //[nuevaMoto setValue:[self.tipoPickerView ] forKeyPath:@"tipo"];
}

- (IBAction)cancelarPulsarBoton:(id)sender
{
    
}
@end
