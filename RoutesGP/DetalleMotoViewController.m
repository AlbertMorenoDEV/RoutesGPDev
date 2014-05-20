//
//  DetalleMotoViewController.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 24/03/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "DetalleMotoViewController.h"
#import "MantenimientoFichaViewController.h"

@interface DetalleMotoViewController ()

@end

@implementation DetalleMotoViewController

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
    
    
    
    self.fotoMotoImg.image = [UIImage imageNamed:@"start-button.png"];
    self.fotoMotoImg.contentMode = UIViewContentModeScaleAspectFill;
    self.fotoMotoImg.clipsToBounds = YES;
    self.fotoMotoImg.layer.cornerRadius = 48.0f;
    self.fotoMotoImg.layer.borderWidth = 4.0f;
    self.fotoMotoImg.layer.borderColor = [UIColor whiteColor].CGColor;
    
    UIColor* imageBorderColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:0.4f];
    
    [self styleFriendProfileImage:self.fotoLugarImg withImageNamed:@"menuGrupos.png" andColor:imageBorderColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)desplazarViewMantenimiento:(id)sender {
    
   // MantenimientoFichaViewController * mantenimientoFichaVC =[[MantenimientoFichaViewController alloc] ini
}
@end
