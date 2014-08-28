//
//  MCSAnnotation.m
//  MyCoolSpots
//
//  Created by Daniel Merrill on 8/18/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

#import "MCSAnnotation.h"

@implementation MCSAnnotation

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordinate = newCoordinate;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
}
@end
