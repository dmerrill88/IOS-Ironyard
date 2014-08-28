//
//  GameScene.swift
//  Balloons2
//
//  Created by Daniel Merrill on 8/21/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate
{
    
    var centerPoint = CGPointMake(0, 0)
    
    var balloons: [SKSpriteNode] = []
    
    override func didMoveToView(view: SKView)
    {
        
        
        centerPoint = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.physicsWorld.gravity = CGVectorMake(0, -0.9)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.contactDelegate = self
        
        
        
        
        for i in 0...10{
            
            var spriteNode = SKSpriteNode(imageNamed: "balloon_gold")
            
            // spriteNode = SKShapeNode(ellipseInRect: CGRectMake(0, 0, 10, 20))
            
            
            spriteNode.xScale = 0.5
            
            spriteNode.yScale = 0.5
            
            spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: spriteNode.frame.size.width/2.0)
            
            spriteNode.physicsBody.restitution = 1.0
            
            spriteNode.physicsBody.density = 0.4
            
            spriteNode.physicsBody.mass = 0.05
            
            spriteNode.physicsBody.categoryBitMask = 1
            
            var floatI = CGFloat(i)
            
            
            
            spriteNode.position = CGPointMake(self.frame.width / 10.0 * floatI,  300.0)
            
            // spriteNode.position = CGPointMake(160, 300)
            
            
            self.addChild(spriteNode)
            
            balloons += [spriteNode]
            
        }
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        /* Called when a touch begins */
        
      
            
            for touch: AnyObject in touches
            {
                
                
                let location = touch.locationInNode(self)
                
                var dart = SKSpriteNode(imageNamed: "Dart")
                
                dart.position = location
                

                
                dart.physicsBody = SKPhysicsBody(rectangleOfSize: dart.frame.size)
                
                dart.physicsBody.contactTestBitMask = 1

                
                self.addChild(dart)
                
            }
            
            
        }
    
    
    func  didBeginContact(contact: SKPhysicsContact!)
    {
        for balloon in balloons {
            
            if balloon == contact.bodyA.node || balloon == contact.bodyB.node
            {
                balloon.removeFromParent()
                
                var pop = SKAction.playSoundFileNamed("pop.mp3", waitForCompletion: false)
                
                self.runAction(pop)
                
            }
            
            
        }
        
        
        
        
        
//        contact.bodyB.node.removeFromParent()
//        contact.bodyA.node.removeFromParent()
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    

}


