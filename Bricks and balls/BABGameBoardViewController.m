//
//  BABGameBoardViewController.m
//  Bricks and balls
//
//  Created by Daniel Merrill on 8/6/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "BABGameBoardViewController.h"

#import "BABLevelData.h"

#import "BABHeaderView.h"

#import <Crashlytics/Crashlytics.h>


///////////////////////////////////////////////////////////////////////////////////////////////////////////

// 3 lives
// after you hit floor start new ball and take away one life
// once all 3 lives( int varible) lost game over alert, with option to restart (should reset life count) resetlife count)

// score count, bricks broken  add points to score count
// create temporary lable for score count

///////////////////////////////////////////////////////////////////////////////////////////////////////////

//When gameover clear bricks and show start button
//create new class called "BABLevelData" as a subclass of NSObject   √
//make a method that will drop a uiview (gravity) from a broken brick like a power up
// listen for it to collide with paddle
// randomly change size of paddle when powerup hit paddle

///////////////////////////////////////////////////////////////////////////////////////////////////////////


@interface BABGameBoardViewController () <UICollisionBehaviorDelegate>

@end

@implementation BABGameBoardViewController
{
    UIDynamicAnimator * animator;
    UIDynamicItemBehavior * ballItemBehavior;
    UIView * ball;
    UIGravityBehavior * gravityBehavior;
    //UIView * ball2;
    UICollisionBehavior * collisionBehavior;
    NSMutableArray * bricks;
    UIDynamicItemBehavior * brickItemBehavior;
    UIView * paddle;
    UIAttachmentBehavior * attatchmentBehavior;
    int lifeCount;
    BABHeaderView * headerView;
    UIButton * startButton;
    UIView * ballItem;
    NSObject * BABLevelData;
    UIAlertView * alertWon;
    UIAlertView * alertLost;
    UICollisionBehavior * powerupCollision;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        
        
        [BABLevelData mainData].number = 8;
        
        
        
        bricks = [@[] mutableCopy];
        
        
        headerView = [[BABHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        
        [self.view addSubview:headerView];
        
        
        animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        ballItemBehavior = [[UIDynamicItemBehavior alloc] init];
        
        //ballItemBehavior.density = 10000;
        
        ballItemBehavior.friction = 0;
        ballItemBehavior.elasticity = 1;
        ballItemBehavior.resistance = 0;
        ballItemBehavior.allowsRotation = NO;
        
        [animator addBehavior:ballItemBehavior];
        
        gravityBehavior = [[UIGravityBehavior alloc] init];
        
        
        gravityBehavior.gravityDirection = CGVectorMake(0.0, 5.0);
        
        [animator addBehavior:gravityBehavior];
        
        
        collisionBehavior = [[UICollisionBehavior alloc] init];
        
        collisionBehavior.collisionDelegate = self;
        
        // collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
        
        int w = SCREEN_WIDTH;
        int h = SCREEN_HEIGHT;
        
        [collisionBehavior addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h + 20) toPoint:CGPointMake(w, h + 20)];
        [collisionBehavior addBoundaryWithIdentifier:@"left wall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, h)];
        [collisionBehavior addBoundaryWithIdentifier:@"right wall" fromPoint:CGPointMake(w, 0) toPoint:CGPointMake(w, h)];
        [collisionBehavior addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(w, 0)];
        
        
        [animator addBehavior:collisionBehavior];
        
        brickItemBehavior = [[UIDynamicItemBehavior alloc] init];
        
        brickItemBehavior.density = 1000000;
        
        [animator addBehavior:brickItemBehavior];
        
        // Custom initialization
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) / 2, SCREEN_HEIGHT - 10, 100, 4)];
    
    
    paddle.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:paddle];
    
    [self showStartButtonWithTitle:@"START"];
    
    
   // [self newBall];
    
    // ball2 =  [[UIView alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
    
    // ball2.layer.cornerRadius = 50;
    
    // ball2.backgroundColor = [UIColor cyanColor];
    
    //[self.view addSubview:ball2];
    
    
    
            
            
       // }
    
    

    
    
}

- (void)showStartButtonWithTitle:(NSString *)title
{
    for (UIView * brick in bricks)
    {
        
        [brick removeFromSuperview];
        [brickItemBehavior removeItem:brick];
        [collisionBehavior removeItem:brick];
        
    }
    
    [bricks removeAllObjects];
    
    startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) / 2, (SCREEN_HEIGHT - 100) / 2, 100, 100)];
    [startButton setTitle:title forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    startButton.backgroundColor = [UIColor grayColor];
    startButton.layer.cornerRadius = 50;
    [self.view addSubview:startButton];
}


-(void)startGame
    {
        [startButton removeFromSuperview];
        
        [self resetBricks];
        [self newBall];
    }




- (void)viewWillAppear:(BOOL)animated

{
    [super viewWillAppear:animated];
    
    attatchmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:paddle attachedToAnchor:paddle.center];
    
    [animator addBehavior:attatchmentBehavior];
    
    
    
    
    
    
    // [ballItemBehavior addItem:ball2];
    // [gravityBehavior addItem:ball];
    // [collisionBehavior addItem:ball2];
    
    
    [powerupCollision addItem:paddle];
    [collisionBehavior addItem:paddle];
    [brickItemBehavior addItem:paddle];
    //[self.resetBricks];
    
//    [collisionBehavior addItem:ball];
//    
//    
//    [ballItemBehavior addItem:ball];
//    
//    UIPushBehavior * pushBehavior = [[UIPushBehavior alloc] initWithItems:@[ball] mode:UIPushBehaviorModeInstantaneous];
//    
//    pushBehavior.pushDirection = CGVectorMake(0.1, -.1);
//    
//    [animator addBehavior:pushBehavior];
    
//    [self resetBricks];
//    [self newBall];

}

-(void) resetBricks

{

    
    
    int colCount = [[[BABLevelData mainData] levelInfo][@"cols"] intValue];
    int rowCount = [[[BABLevelData mainData] levelInfo][@"rows"] intValue];

    int brickSpacing = 8;
    
    for (int col = 0; col < colCount; col++)
    {
        for (int row = 0; row < rowCount; row++)
        {
            
            float width = (SCREEN_WIDTH - (brickSpacing * (colCount + 1))) / colCount;
            float height = ((SCREEN_HEIGHT / 3) - (brickSpacing * rowCount))  / rowCount;
            
            float x =brickSpacing + (width + brickSpacing) * col;
            
            float y =brickSpacing + (height + brickSpacing) * row + 30;
            
            
           UIView * brick = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            brick.backgroundColor = [UIColor lightGrayColor];
            
            [self.view addSubview:brick];
            
            [bricks addObject:brick];
            
                [collisionBehavior addItem:brick];
                [brickItemBehavior addItem:brick];
            
        }
        
        
        



    }
}

-(void)newBall
{
    
    ball =[[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 20) / 2, SCREEN_HEIGHT - 50, 20, 20)];
    ball.layer.cornerRadius = ball.frame.size.width / 2;
    ball.backgroundColor = [UIColor blueColor];
    [self.view addSubview:ball];
    [collisionBehavior addItem:ball];
    
    
    [ballItemBehavior addItem:ball];
    
    
    UIPushBehavior * pushBehavior = [[UIPushBehavior alloc] initWithItems:@[ball] mode:UIPushBehaviorModeInstantaneous];
    
    pushBehavior.pushDirection = CGVectorMake(0.1, -.1);
    
    [animator addBehavior:pushBehavior];
    

    
}


- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p

{
    if ([@"floor" isEqualToString:(NSString *)identifier])
    {
        ballItem = (UIView *)item;

        [collisionBehavior removeItem:ballItem];
        headerView.lives --;
        [ballItem removeFromSuperview];

    
        ball = nil;
        
        if(headerView.lives >0)
        {

            [self newBall];

        }
        else
        {
//            alertLost = [[UIAlertView alloc] initWithTitle:@"Game Over Loser" message:[NSString stringWithFormat:@"Just give up!"] delegate:self cancelButtonTitle:@"Replay level" otherButtonTitles: nil];
//            [alertLost show];
            
            headerView.score = 0;
            
            [self showStartButtonWithTitle:@"Try Again"];
        }
        
        
        
   
    }
  
}



- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p

{
    for (UIView * brick in [bricks copy])
    {
        if ([item1 isEqual:brick] || [item2 isEqual:brick])
        {
            headerView.score +=100;
            [collisionBehavior removeItem:brick];
            //scoreLable.text = [NSString stringWithFormat:@" Score %d", headerView.score];
            [gravityBehavior addItem:brick];
            
            [bricks removeObjectIdenticalTo:brick];
            
            
            [UIView animateWithDuration:0.3 animations:^{
                brick.alpha = 0;
                
                
            } completion:^(BOOL finished) {
            
            
           [brick removeFromSuperview];
           [bricks removeObjectIdenticalTo:brick];

                
            // is bricks.count == 0 then you won
                
                
                
                if(bricks.count == 0)
                {
                    
//                   alertWon = [[UIAlertView alloc] initWithTitle:@"Game Won" message:[NSString stringWithFormat:@"You Win"] delegate:self cancelButtonTitle:@"Play again" otherButtonTitles: nil];
//                    [alertWon show];
                    
                    
                    
                    if (( [BABLevelData mainData].currentLevel)==[[BABLevelData mainData].levels count] - 1)
                    {
                        NSLog(@"you won");
                        [BABLevelData mainData].currentLevel=0;
//                        [self restartGame];
                    }else {
                        
                        [BABLevelData mainData].currentLevel++;
                        
                        
                    }
                    
                    
                    [self showStartButtonWithTitle:@"Next Level"];
                    [ballItem removeFromSuperview];
                    [collisionBehavior removeItem:ball];
                    
                    
                    

                }
                


                
            }];
        }
    }
}



    - (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
    {
        
        [self restartGame];

    }
        

-(void) restartGame
{
    //        if (headerView.lives == 0)
    //        {
    
    for (UIView *brick in bricks)
    {
        [brick removeFromSuperview];
        [brickItemBehavior removeItem:brick];
        [collisionBehavior removeItem:brick];
    }
    
    
    
    [self startGame];
    
    headerView.score = 0;
    headerView.lives = 3;

    
    
    attatchmentBehavior.anchorPoint = CGPointMake(SCREEN_WIDTH / 2.0, paddle.center.y);
    
    
    
    //    if(headerView.lives < -1)
    //    {
    //
    //        [self newBall];
    //        [collisionBehavior addItem:brick];
    //        [brickItemBehavior addItem:brick];
    //    }
    //    else
    //    {
    //
    //    }
    //
    //
}









-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self movePaddleWithTouches:touches];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self movePaddleWithTouches:touches];
}


-(void)movePaddleWithTouches:(NSSet *)touches

{
    UITouch * touch = [touches allObjects] [0];
    CGPoint location = [touch locationInView:self.view];
    
    
    float guard = paddle.frame.size.width / 2 + 10;
    float dragx = location.x;
    
    if (dragx < guard) dragx =guard;
    
    if (dragx > SCREEN_WIDTH - guard) dragx = SCREEN_WIDTH - guard;
    
    attatchmentBehavior.anchorPoint = CGPointMake(dragx, paddle.center.y);
    
    paddle.center = CGPointMake(location.x, paddle.center.y);
    
    
}










-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end

