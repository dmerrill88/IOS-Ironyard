//
//  SCRDrawView.m
//  Scribbles
//
//  Created by Daniel Merrill on 8/4/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "SCRDrawView.h"

@implementation SCRDrawView
{
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.scribbles = [@[] mutableCopy];
        
        self.backgroundColor = [UIColor grayColor];
        
        self.lineColor = [UIColor whiteColor];
        self.lineWidth = 1;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.




- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // this grabs our context layer to draw on
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //  [[UIColor whiteColor] set];
    
    //  [self.lineColor set];
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    
    for (NSDictionary * scribble in self.scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"] intValue]);
        NSArray * points = scribble[@"points"];
        
        UIColor * lineColor = scribble[@"color"];
        [lineColor set];
        
        
        if (points.count
            >0) {
            CGPoint startPoint = [points[0] CGPointValue];
            
            CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        }
        
        for (NSValue * pointVal in points) {
            
            CGPoint point = [pointVal CGPointValue];
            
            CGContextAddLineToPoint(context, point.x, point.y);
            
        }
        
        
        //this draws the context
        CGContextStrokePath(context);
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    //    CGContextAddEllipseInRect(context, CGRectMake(20, 20, 100, 100));
    //
    //    [[UIColor redColor] set];
    //
    //
    //    CGContextFillPath(context);
    //
    //    CGContextAddEllipseInRect(context, CGRectMake(60, 20, 100, 100));
    //
    //    [[UIColor colorWithWhite:1.0 alpha:0.5] set];
    //
    //    CGContextFillPath(context);
    //
    //
    //    CGContextSetLineWidth(context, 10);
    //
    //    CGContextMoveToPoint(context, 10, 10);
    //
    //    CGContextAddLineToPoint(context, 50, 50);
    //
    //    CGContextAddLineToPoint(context, 50, 50);
    //
    //    CGContextAddLineToPoint(context, 50, 50);
    //
    //    CGContextAddLineToPoint(context, 50, 50);
    //
    //    CGContextStrokePath(context);
    
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // int random = arc4random_uniform(20) +5;
    
    
    self.currentScribble = [ @{
                               @"color":self.lineColor,
                               @"points":[@[] mutableCopy],
                               @"width":@(self.lineWidth)
                               } mutableCopy];
    
    [self.scribbles addObject:self.currentScribble];
    
    
    if (self.scribbleDrawStyle)
    {
        //this is for scribble
        [self scribbleWithTouches:touches];
    }
    else
    {
        //this is for lines
        UITouch * touch = [touches allObjects] [0];
        CGPoint location = [ touch locationInView:self];
        self.currentScribble[@"points"][0] = [NSValue valueWithCGPoint:location];
        [self setNeedsDisplay];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.scribbleDrawStyle)
    {
        //this is for scribble
        [self scribbleWithTouches:touches];
    }
    else
    {
        //this is for lines
        UITouch * touch = [touches allObjects] [0];
        CGPoint location = [ touch locationInView:self];
        self.currentScribble[@"points"][1] = [NSValue valueWithCGPoint:location];
        [self setNeedsDisplay];
    }
}


-(void)scribbleWithTouches:(NSSet *)touches

{
    for (UITouch * touch in touches) {
        
        CGPoint location = [ touch locationInView:self];
        
        [self.currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
    [self setNeedsDisplay];
    
}

@end
