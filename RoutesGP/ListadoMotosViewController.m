//
//  ListadoMotosViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 24/03/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "ListadoMotosViewController.h"
#import "ListadoMotosCell.h"

@interface ListadoMotosViewController (){

    NSArray *datos;
}
@end

@implementation ListadoMotosViewController

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
    
    datos = [NSArray arrayWithObjects:@"foo",@"bar",@"baz",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)volverMenuPrincipal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Metod UITableViewDelegate
// Método necesario para devolver el número de secciones de la tabla, por lo general será siempre 1..
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// Necesario para indicar el número de filas de la tabla, esto suele ir ligado al tamaño de un array de elementos a mostrar..
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [datos count];
}


#pragma mark - Metod UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier= @"Cell";
    //AlertaPasajero * alertaPasajero =[datos objectAtIndex:indexPath.row];
    
    ListadoMotosCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    /*
    cell.textAlert.text = alertaPasajero.texto;
    cell.typeAlert.text=alertaPasajero.tipo;
    cell.subTypeAlert.text=alertaPasajero.subTipo;
    [cell.enableAlert setOn:alertaPasajero.alertaActiva];
    [cell.enableAlert addTarget:self action:@selector(setState:) forControlEvents:UIControlEventValueChanged];
    cell.enableAlert.tag= indexPath.row;
    */
    UIColor* imageBorderColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:0.4f];
    
     [self styleFriendProfileImage:cell.imagenMoto withImageNamed:@"menuGrupos.png" andColor:imageBorderColor];
    
    return cell;
}

#pragma  Redondeando el UIImageView

-(void)styleFriendProfileImage:(UIImageView*)imageView withImageNamed:(NSString*)imageName andColor:(UIColor*)color{
    
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 30.0f;
    imageView.layer.borderWidth = 4.0f;
    imageView.layer.borderColor = color.CGColor;
}

@end
