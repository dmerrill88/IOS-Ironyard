//
//  MSAData.h
//  Mayorships
//
//  Created by Daniel Merrill on 8/19/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSAData : NSObject

+ (MSAData *)mainData;


//@property (nonatomic) ;


@property (nonatomic)  NSArray * VendorsWithMayors;

@property (nonatomic)  NSArray * VendorsWithoutMayors;


- (void)fillArrays;

//- (NSDictionary *) ;


@end
