//
//  SCRDrawViewController.m
//  Scribbles
//
//  Created by Daniel Merrill on 8/4/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "SCRDrawViewController.h"

#import "SCRDrawView.h"
#import "SCRSlideView.h"

@interface SCRDrawViewController () <SCRSlideViewDelegate>

@end

@implementation SCRDrawViewController

{
    NSArray * colors;
    NSMutableArray * colorButtons;
    
    //    UIButton * chooseColor;
    UIButton * centerButton;
    
    BOOL colorChoicesOpen;
    UIView * lineWithSize;
    SCRSlideView * lineSlider;
}

//add reset button
//



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        colorButtons = [@[] mutableCopy];

        self.view = [[SCRDrawView alloc]initWithFrame:self.view.frame];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self createColorWheel];
    
    // Do any additional setup after loading the view.
    
    lineWithSize = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 2)];
    
    lineWithSize.backgroundColor = [UIColor blackColor];
    
    UIButton * openLineWidthSlider = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 60, 40, 40)];
    openLineWidthSlider.layer.borderWidth = 1;
    openLineWidthSlider.layer.cornerRadius = 20;
    openLineWidthSlider.layer.borderColor = [UIColor blackColor].CGColor;
    
    [openLineWidthSlider addTarget:self action:@selector(openSlider) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openLineWidthSlider];
    lineWithSize.center = openLineWidthSlider.center;
    
    
    
    
    
    
    UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake(230.0,  10.0, 80.0, 20.0)];
    
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];

    resetButton.backgroundColor = [UIColor redColor];
    
    resetButton.layer.cornerRadius = 10.0;
    
    [resetButton addTarget:self action:@selector(ResetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:resetButton];
    
    
    
    
    UIButton * scribbleButton = [[UIButton alloc] initWithFrame:CGRectMake(260.0,  390.0, 35.0, 35.0)];

    [scribbleButton setBackgroundImage:[UIImage imageNamed:@"scribble_button"] forState:UIControlStateNormal];
    
    scribbleButton.layer.cornerRadius = 17.5;
    
    [scribbleButton addTarget:self action:@selector(ScribbleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:scribbleButton];
    
    
    
    
    UIButton * lineButton = [[UIButton alloc] initWithFrame:CGRectMake(260.0,  350.0, 35.0, 35.0)];
    
    [lineButton setBackgroundImage:[UIImage imageNamed:@"lines_button"] forState:UIControlStateNormal];
    
    lineButton.layer.cornerRadius = 17.5;
    
    [lineButton addTarget:self action:@selector(LineButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:lineButton];
    
    
}




-(void)openSlider
{
    
    if (lineWithSize)
    {
        [lineWithSize removeFromSuperview];
        lineWithSize = nil;
        return;
    }
    
    
    lineSlider = [[SCRSlideView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 280, 40, 200)
                  ];
    lineSlider.currentWidth = self.view.lineWidth;
    
    
    lineSlider.delegate = self;
    
    
    [self.view addSubview:lineSlider];
    
}

-(void)createColorWheel
{
    
    colors = @[
               [UIColor cyanColor],
               [UIColor magentaColor],
               [UIColor yellowColor],
               [UIColor blueColor],
               [UIColor purpleColor],
               [UIColor greenColor],
               ];
    
    float size = 40;
    float posX = (SCREEN_WIDTH - size) /2;
    float posY = (SCREEN_HEIGHT - size) -20;
    centerButton = [[UIButton alloc] initWithFrame:CGRectMake(posX, posY, size, size)];
    
    centerButton.backgroundColor = [UIColor whiteColor];
    
    centerButton.layer.cornerRadius = size / 2;
    
    [centerButton addTarget:(self) action:@selector(showColorChoices) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:centerButton];
    
    self.view.lineColor = colors[0];
}

-(void)hideColorChoices

{
    for (UIButton * colorButton in colorButtons)
    {
        NSInteger index = [colorButtons indexOfObject:colorButton];
        
        [UIView animateWithDuration:0.2 delay:0.05 * index options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            colorButton.center = centerButton.center;
            
        }completion:^(BOOL finished) {
            
            [colorButton removeFromSuperview];
        }];
    }
    
    [colorButtons removeAllObjects];
    colorChoicesOpen = NO;
}



-(void)showColorChoices
{
    NSLog(@"show method");
    if (colorChoicesOpen)
    {
        
        NSLog(@"closing colors");
        [self hideColorChoices];
        return;
    }
    
    
    NSLog(@"opening colors");
    
    for (UIColor * color in colors)
    {
        NSInteger index = [colors indexOfObject:color];
        
        UIButton * colorButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        
        colorButton.center = centerButton.center;
        
        colorButton.backgroundColor = color;
        
        colorButton.layer.cornerRadius = 20;
        
        [colorButton addTarget:(self) action:@selector(changeLineColor:) forControlEvents:UIControlEventTouchUpInside];
        
        float radius = 60;
        float mpi = M_PI/180;
        float angle = 360 / colors.count;
        float radians = angle * mpi;
        
        float moveX = centerButton.center.x + sinf(radians * index) * radius;
        float moveY = centerButton.center.y + cosf(radians * index) * radius;
        
        
        [UIView animateWithDuration:0.2 delay:0.05 * index options:UIViewAnimationOptionAllowUserInteraction animations:^{
            colorButton.center = CGPointMake(moveX, moveY);
            
        }completion:^(BOOL finished) {
            
        }];
        
        [self.view addSubview:colorButton];
        [colorButtons addObject:colorButton];
    }
    
    colorChoicesOpen = YES;
    
}

-(void)changeLineColor: (UIButton *)button

{
    SCRDrawView * view = (SCRDrawView *)self.view;
    
    view.lineColor = button.backgroundColor;
    
    [view setNeedsDisplay];
}



-(void)updateLineWidth:(float)lineWidth
{
    self.view.lineWidth = lineWidth;
    
    CGPoint center = lineWithSize.center;
    lineWithSize.frame = CGRectMake(0, 0, lineWidth * 2, lineWidth * 2);
    lineWithSize.center = center;
    lineWithSize.layer.cornerRadius = lineWidth;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}



- (void)ResetButtonClicked
{
    NSLog(@"button was clicked");
    

    [self.view.scribbles removeAllObjects];
    [self.view setNeedsDisplay];
}

- (void)ScribbleButtonClicked
{
    NSLog(@"button was clicked");
    
    self.view.scribbleDrawStyle = YES;
    
    
    
}


- (void)LineButtonClicked
{
    NSLog(@"button was clicked");
    
    
    self.view.scribbleDrawStyle = NO;

    
    
    
    
    
}





@end



// [self.view insertSubview:[colorButton atIndex:0];
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//        float radius = size / 2;
//      //define radius as a CGfloat value and define circle as a CGpoint
//        UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:centerButton.center
//                                                              radius:radius
//                                                          startAngle:0
//                                                            endAngle:2.0*M_PI
//                                                           clockwise:YES];
//
//       CAShapeLayer *circleLayer = [CAShapeLayer layer];
//        circleLayer.bounds = CGRectMake(0, 0, 2.0*radius, 2.0*radius);
//       circleLayer.path   = circle.CGPath;
//       circleLayer.strokeColor = [UIColor orangeColor].CGColor;
//      circleLayer.lineWidth   = 3.0; // your line width
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////

