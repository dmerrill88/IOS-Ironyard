//
//  MCSAnnotation.h
//  MyCoolSpots
//
//  Created by Daniel Merrill on 8/18/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/Mapkit.h>

@interface MCSAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly,copy)  NSString * title;

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;


- (void)setTitle:(NSString *)title;


@end
