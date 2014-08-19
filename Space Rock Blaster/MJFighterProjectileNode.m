//
//  MJFighterProjectileNode.m
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import "MJFighterProjectileNode.h"
#import "MJSettings.h"


@implementation MJFighterProjectileNode


+(instancetype) projectileAtPosition:(CGPoint)position {
    
    MJFighterProjectileNode *projectile = [self spriteNodeWithImageNamed:@"missile"];
    projectile.position = position;
    projectile.zPosition = 5;
    projectile.name = @"Missle";
    
    [projectile setupAnimation];
    [projectile setupPhysicsBody];
    
    return  projectile;
}

-(void) moveTowardsPosition:(CGPoint)position
{
    CGPoint pointOffscreen = CGPointMake(position.x, self.parent.frame.size.height * 2);

    float distance = self.parent.frame.size.width + 25;
    float time = distance / MJProjectileSpeed ;
    float waitToFade = time * 0.75;
    //float waitToFade = time * 2;
   // NSLog(@"PointOffScreen %f",distance);
    float fadeTime = time - waitToFade;
    
    SKAction *moveProjectile = [SKAction moveTo:pointOffscreen duration:2.0];
    [self runAction:moveProjectile];
    
    NSArray *sequence = @[[SKAction waitForDuration:waitToFade],
                          [SKAction fadeOutWithDuration:fadeTime],
                          [SKAction removeFromParent]];
    [self runAction:[SKAction sequence:sequence]];
}

-(void) setupAnimation {
//    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
//                          [SKTexture textureWithImageNamed:@"projectile_2"],
//                          [SKTexture textureWithImageNamed:@"projectile_3"]];
//    
//    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
//    SKAction *repeatAction = [SKAction repeatActionForever:animation];
//    [self runAction:repeatAction];
//    
}

- (void) setupPhysicsBody {
//    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
//    self.physicsBody.affectedByGravity = NO;
//    self.physicsBody.categoryBitMask = MJCollisionCategoryProjectile;
//    self.physicsBody.collisionBitMask = 0;
//    self.physicsBody.contactTestBitMask = MJCollisionCategoryEnemy;
//    
//    
}


@end
