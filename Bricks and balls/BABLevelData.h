//
//  BABLevelData.h
//  Bricks and balls
//
//  Created by Daniel Merrill on 8/8/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BABLevelData : NSObject

+ (BABLevelData *)mainData;

@property (nonatomic) int number;

@property (nonatomic) int topScores;

@property (nonatomic) int currentLevel;

@property (nonatomic)  NSArray * levels;


- (NSDictionary *) levelInfo;



@end
