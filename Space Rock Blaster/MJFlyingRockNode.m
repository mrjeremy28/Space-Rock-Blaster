//
//  MJFlyingRockNode.m
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import "MJFlyingRockNode.h"
#import "MJSettings.h"

@implementation MJFlyingRockNode

+ (instancetype) flyingRockAtPosition:(CGPoint)position {
    
    MJFlyingRockNode *flyingRock = [self spriteNodeWithImageNamed:@"rock"];
    flyingRock.zPosition = 2;
    flyingRock.position = position;
    
    float scale = [MJSettings randomWithMin:85 max:100] / 100.0f;
    flyingRock.xScale = scale;
    flyingRock.yScale = scale;
    
    [flyingRock setupPhysicsBody];
    
    return flyingRock;
    
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    //self.physicsBody.categoryBitMask = MJCollisionCategoryEnemy;
    //self.physicsBody.collisionBitMask = 0;
   // self.physicsBody.contactTestBitMask = MJCollisionCategoryProjectile | MJCollisionCategoryGround; // 0010 | 1000 = 1010
    
}

@end
