//
//  BABLevelData.m
//  Bricks and balls
//
//  Created by Daniel Merrill on 8/8/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "BABLevelData.h"

@implementation BABLevelData

{
    
}

+ (BABLevelData *)mainData;

{
    static dispatch_once_t create;
    
    static BABLevelData * singleton = nil;
    
    
    dispatch_once(&create, ^{
        
        singleton = [[BABLevelData alloc] init];
        
        
    });
    
    return singleton;
    
}



-(id)init

{
    self = [super init];
    
    if (self)
    {
        NSUserDefaults * nsDefaults = [NSUserDefaults standardUserDefaults];

        
        self.topScores = (int) [nsDefaults integerForKey:@"topScores"];
        
        
        self.levels = @[
                   @{
                       @"cols" : @5,
                       @"rows": @3,
                       
                       },
                   @{
                       @"cols" : @10,
                       @"rows" :@7,
                       },
                   @{
                       @"cols" : @10,
                       @"rows": @10,
                       
                       },
                   ];
    }
    return self;
    
}

-(void) setTopScores:(int)topScores
{
    _topScores = topScores;
    
    NSUserDefaults * nsDefaults = [NSUserDefaults standardUserDefaults];
    
    [nsDefaults setInteger:topScores forKey:@"topScores"];
    [nsDefaults synchronize];
    
}

-(NSDictionary *) levelInfo
{
    return self.levels [self.currentLevel];
}

@end
