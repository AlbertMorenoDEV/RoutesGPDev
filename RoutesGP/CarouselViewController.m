//
//  CarouselViewController.m
//  CarouselFredyDesdeVacio
//
//  Created by ntl on 3/19/14.
//  Copyright (c) 2014 ntl. All rights reserved.
//

#import "CarouselViewController.h"

@interface CarouselViewController ()

@end


@interface CarouselViewController ()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) BOOL wrap;

@end

@implementation CarouselViewController
@synthesize firstCarousel;
@synthesize items;
@synthesize wrap;

- (void)awakeFromNib
{
    //set up data
    //your carousel should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.items = [NSMutableArray array];
    for (int i = 0; i < 3; i++)
    {
        [items addObject:@(i)];
    }
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    firstCarousel.delegate = nil;
    firstCarousel.dataSource = nil;
}

#pragma mark - viewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //configure carousel
    firstCarousel.type = iCarouselTypeLinear;
    firstCarousel.backgroundColor = [UIColor clearColor];
    //firstCarousel.alpha = 0.5;
    //firstCarousel.bounds =CGRectMake(0, 0, 20, 20);
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.firstCarousel = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    UIImageView *imagen =nil;

    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        NSLog(@"View si nil");
        

        /*view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 400, 600)];
        view.backgroundColor = [UIColor yellowColor];
        view.contentMode = UIViewContentModeCenter;
        //[firstCarousel addSubview:view];
        
        imagen = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 600)];
        imagen.image = [UIImage imageNamed:@"INICIO_LOGO.jpg"];

        
        [firstCarousel addSubview:imagen];
        
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        
        
        //label.backgroundColor = [UIColor clearColor];
        //label.alpha = 0;
        label.textAlignment = NSTextAlignmentCenter;// depreciado
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [firstCarousel addSubview:label];*/
        
         view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150.0f, 150.0f)];
        
         //((UIImageView *)view).image = [UIImage imageNamed:@"Menu_motos.png"];
         view.contentMode = UIViewContentModeCenter;
         //view.backgroundColor = [UIColor redColor];
        
        //[view addSubview:imagen];
        
         label = [[UILabel alloc] initWithFrame:view.bounds];
        //label = [[UILabel alloc] initWithFrame:CGRectMake(130, 420, 100, 60)];
        
         label.backgroundColor = [UIColor clearColor];
         //label.alpha = 0;
         label.textAlignment = NSTextAlignmentCenter;// depreciado
         label.font = [label.font fontWithSize:50];
         label.tag = 1;
         [view addSubview:label];
        imagen = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150.0f, 130.0f)];
        imagen.image = [UIImage imageNamed:@"page.png"];
        [label addSubview:imagen];
        
        
    }
    else
    {
        NSLog(@"paso view no nil");
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
        
        
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [items[index] stringValue];
    
    switch ([items[index] integerValue]) {
        case 0:
            label.text = @"aa";
            imagen.image = [UIImage imageNamed:@"menuGrupos.png"];
            break;
        case 1:
            label.text = @"bb";
            imagen.image = [UIImage imageNamed:@"menuRoutes.png"];
            break;
        case 2:
            label.text = @"ccc";
            imagen.image = [UIImage imageNamed:@"menuMotos.png"];
            break;
            
            
        default:
            break;
    }
        //label.backgroundColor = [UIColor redColor];
    
    return view;
}


- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * firstCarousel.itemWidth);
}

- (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (firstCarousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        default:
        {
            return value;
        }
    }
}


#pragma mark - iCarousel taps

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (self.items)[index];
    NSLog(@"Tapped view number: %@", item);
}

@end