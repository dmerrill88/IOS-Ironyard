//
//  SIGDrawView.h
//  signatures2
//
//  Created by Daniel Merrill on 8/14/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIGDrawView : UIView

@property (nonatomic) NSMutableArray * scribbles;

@property (nonatomic) NSMutableArray * currentScribbles;

@property (nonatomic) UIImage * scribblesImage;

@end
