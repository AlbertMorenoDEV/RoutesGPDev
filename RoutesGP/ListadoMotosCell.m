//
//  ListadoMotosCell.m
//  RoutesGP
//
//  Created by iFredy on 02/05/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "ListadoMotosCell.h"

@implementation ListadoMotosCell
@synthesize imagenMoto;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
