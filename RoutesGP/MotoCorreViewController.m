//
//  MotoCorreViewController.m
//  RoutesGP
//
//  Created by ntl on 3/7/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "MotoCorreViewController.h"

@interface MotoCorreViewController ()

@end

@implementation MotoCorreViewController

// para probar si sube al gith

-(IBAction)start:(id)sender
{
    
    int RandomValue1 = arc4random_uniform(400)+50;
    int RandomValue2 = arc4random_uniform(200)+50;
    
    
    //int value = (arc4random() % x) + 1;
    
    UIBezierPath *bezierPath =[[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(moto.center.x, moto.center.y)];
    //[bezierPath addCurveToPoint:CGPointMake(500, 300)
    //              controlPoint1:CGPointMake(100, 200)
    //              controlPoint2:(CGPointMake(40, 200))];
    
    //[bezierPath addCurveToPoint:CGPointMake(moto.center.x+800, moto.center.y+200)
    //              controlPoint1:CGPointMake(moto.center.x-100,moto.center.y+5)
    //              controlPoint2:CGPointMake(moto.center.x-170, moto.center.y-5)];
    
    //[bezierPath addQuadCurveToPoint:CGPointMake(moto.center.x+800, moto.center.y+200) controlPoint:CGPointMake(moto.center.x-400, moto.center.y+200)];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(moto.center.x+800, moto.center.y+200) controlPoint:CGPointMake(moto.center.x-RandomValue1, moto.center.y+RandomValue2)];
    
    
    //NSLog(@"%@",bezierPath);
    
    CAShapeLayer *pathLayer =  [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    //pathLayer.strokeColor = [UIColor whiteColor].CGColor;
    //pathLayer.lineWidth = 1.0f;
    
    [self.view.layer addSublayer:pathLayer];
    
    
    
    //moto.hidden = YES;
    
    // creo moto
    CALayer *motoLayer = [CALayer layer];
    motoLayer.bounds = CGRectMake(10, 10, 100, 100);
    motoLayer.position = CGPointMake(10, 10);
    motoLayer.contents = (id)[UIImage imageNamed:@"moto.png"].CGImage;
    
    
    
    
    
    [self.view.layer addSublayer:motoLayer];
    
    
    
    // creo de keyfram animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.path = bezierPath.CGPath;
    
    
    
    CABasicAnimation *escalarAnimacion = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    NSNumber * factorEscala = [NSNumber numberWithFloat:10.0f];
    escalarAnimacion.toValue = factorEscala;
    escalarAnimacion.duration = 1.5f;
    escalarAnimacion.autoreverses= YES;
    [motoLayer addAnimation:escalarAnimacion forKey:@"transformAnimation"];
    
    
    
    //AnimationGroup recorrido + giro para Enterprise
    CAAnimationGroup *agrupacionAnimaciones = [CAAnimationGroup animation];
    agrupacionAnimaciones.animations = [NSArray arrayWithObjects:animation ,escalarAnimacion,nil];
    agrupacionAnimaciones.duration = 5.0;
    // Add the animation to the layer.
    [motoLayer addAnimation:agrupacionAnimaciones forKey:@"positiones"];
    
    //moto.hidden = YES;
    
    
    
    
    
    
}



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

@end
