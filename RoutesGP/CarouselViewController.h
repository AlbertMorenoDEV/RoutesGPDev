//
//  CarouselViewController.h
//  CarouselFredyDesdeVacio
//
//  Created by ntl on 3/19/14.
//  Copyright (c) 2014 ntl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface CarouselViewController : UIViewController<iCarouselDelegate,iCarouselDataSource>


@property (strong, nonatomic) IBOutlet iCarousel *firstCarousel;


@end
