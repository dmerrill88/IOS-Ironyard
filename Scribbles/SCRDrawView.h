//
//  SCRDrawView.h
//  Scribbles
//
//  Created by Daniel Merrill on 8/4/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCRDrawView : UIView

//@property (nonatomic) NSMutableArray * scribblePoints;
@property (nonatomic) BOOL scribbleDrawStyle;

@property (nonatomic) NSMutableArray * scribbles;
@property (nonatomic) NSMutableDictionary * currentScribble;
@property (nonatomic) UIColor * lineColor;
@property (nonatomic) float lineWidth;
@end
