//
//  MJFighterProjectileNode.h
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MJFighterProjectileNode : SKSpriteNode

+(instancetype) projectileAtPosition:(CGPoint)position;


-(void) moveTowardsPosition:(CGPoint)position ;

@end
