//
//  MJFighterJet.h
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MJFighterJet : SKSpriteNode

+ (instancetype) fighterJetInTitleScreenAtPosition:(CGPoint)position;
+ (instancetype) fighterAtPosition:(CGPoint)position;

-(void) moveTowardsPositionLeft:(CGPoint)position;
-(void) moveTowardsPositionRight:(CGPoint)position screenEdge:(CGFloat)screenEdge;


@end
