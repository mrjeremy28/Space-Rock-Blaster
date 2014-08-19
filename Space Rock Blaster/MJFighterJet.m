//
//  MJFighterJet.m
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import "MJFighterJet.h"
#import "MJSettings.h"


@implementation MJFighterJet
+ (instancetype) fighterAtPosition:(CGPoint)position {
   
    MJFighterJet *fighterJetAnimated;
    
    fighterJetAnimated = [self spriteNodeWithImageNamed:@"ship-small_01"];
    fighterJetAnimated.name = @"MainFighter";
    fighterJetAnimated.position = position;
    //fighterJetAnimated.anchorPoint = CGPointMake(1, 1);
    fighterJetAnimated.zPosition = 20;
    
    //    NSMutableArray *textures = [[NSMutableArray alloc] init];
    NSArray *newTextures;
    
    //    for(int i=1; i < 41; i++){
    //        NSString *testString ;
    //        if (i<10) {
    //        testString = [NSString stringWithFormat:@"[SKTexture textureWithImageNamed:@\"ship-morph000%d\"]",i];
    //        } else {
    //        testString = [NSString stringWithFormat:@"[SKTexture textureWithImageNamed:@\"ship-morph00%d\"]",i];
    //        }
    //        [textures addObject:testString];
    //       // NSLog(@"%@",stringArray);
    //    }
    //
    //    for (NSString *obj in textures){
    //        NSLog(@"From ArrayTag obj: %@", obj);
    //    }
    //
    //    NSArray *finalTextures = [[NSArray alloc] initWithArray:textures];
    //
    
    newTextures = @[[SKTexture textureWithImageNamed:@"ship-small_01"],
                    [SKTexture textureWithImageNamed:@"ship-small_02"],
                    [SKTexture textureWithImageNamed:@"ship-small_03"],
                    [SKTexture textureWithImageNamed:@"ship-small_04"]];
    SKAction *animation = [SKAction animateWithTextures:newTextures timePerFrame:0.05];
    
    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [fighterJetAnimated runAction:repeatAction withKey:@"fighterAnimation"];
    
   // [fighterJetAnimated runAction:animation withKey:@"fighterAnimation"];
    
    //[fighterJetAnimated runAction:[SKAction repeatActionForever:animation] withKey:@"animation"];
    
      [fighterJetAnimated setupPhysicsBody];
   
    return  fighterJetAnimated;
}

-(void) moveTowardsPositionLeft:(CGPoint)position {
    
    SKAction *moveShipLeft = [SKAction moveTo:CGPointMake(50, position.y) duration:1.5];
    
    [self runAction:moveShipLeft];
//    [self runAction:moveShipRight];
    
}

-(void) moveTowardsPositionRight:(CGPoint)position screenEdge:(CGFloat)screenEdge {
    
    
    SKAction *moveShipRight = [SKAction moveTo:CGPointMake(screenEdge - 50, position.y) duration:1.5];
    
//    [self runAction:[SKAction sequence:sequence]];
    
    //    [self runAction:moveShipLeft];
        [self runAction:moveShipRight];
    
}

+ (instancetype) fighterJetInTitleScreenAtPosition:(CGPoint)position {
    
    MJFighterJet *fighterJetAnimated;
    
    fighterJetAnimated = [self spriteNodeWithImageNamed:@"ship-morph0040"];
    fighterJetAnimated.name = @"MainFighterTitleScreen";
    fighterJetAnimated.position = position;
//    NSMutableArray *textures = [[NSMutableArray alloc] init];
    NSArray *newTextures;
    
//    for(int i=1; i < 41; i++){
//        NSString *testString ;
//        if (i<10) {
//        testString = [NSString stringWithFormat:@"[SKTexture textureWithImageNamed:@\"ship-morph000%d\"]",i];
//        } else {
//        testString = [NSString stringWithFormat:@"[SKTexture textureWithImageNamed:@\"ship-morph00%d\"]",i];
//        }
//        [textures addObject:testString];
//       // NSLog(@"%@",stringArray);
//    }
//    
//    for (NSString *obj in textures){
//        NSLog(@"From ArrayTag obj: %@", obj);
//    }
//    
//    NSArray *finalTextures = [[NSArray alloc] initWithArray:textures];
//    
    
    newTextures = @[[SKTexture textureWithImageNamed:@"ship-morph0001"],
                    [SKTexture textureWithImageNamed:@"ship-morph0002"],
                    [SKTexture textureWithImageNamed:@"ship-morph0003"],
                    [SKTexture textureWithImageNamed:@"ship-morph0004"],
                    [SKTexture textureWithImageNamed:@"ship-morph0005"],
                    [SKTexture textureWithImageNamed:@"ship-morph0006"],
                    [SKTexture textureWithImageNamed:@"ship-morph0007"],
                    [SKTexture textureWithImageNamed:@"ship-morph0008"],
                    [SKTexture textureWithImageNamed:@"ship-morph0009"],
                    [SKTexture textureWithImageNamed:@"ship-morph0010"],
                    [SKTexture textureWithImageNamed:@"ship-morph0011"],
                    [SKTexture textureWithImageNamed:@"ship-morph0012"],
                    [SKTexture textureWithImageNamed:@"ship-morph0013"],
                    [SKTexture textureWithImageNamed:@"ship-morph0014"],
                    [SKTexture textureWithImageNamed:@"ship-morph0015"],
                    [SKTexture textureWithImageNamed:@"ship-morph0016"],
                    [SKTexture textureWithImageNamed:@"ship-morph0017"],
                    [SKTexture textureWithImageNamed:@"ship-morph0018"],
                    [SKTexture textureWithImageNamed:@"ship-morph0019"],
                    [SKTexture textureWithImageNamed:@"ship-morph0020"],
                    [SKTexture textureWithImageNamed:@"ship-morph0021"],
                    [SKTexture textureWithImageNamed:@"ship-morph0022"],
                    [SKTexture textureWithImageNamed:@"ship-morph0023"],
                    [SKTexture textureWithImageNamed:@"ship-morph0024"],
                    [SKTexture textureWithImageNamed:@"ship-morph0025"],
                    [SKTexture textureWithImageNamed:@"ship-morph0026"],
                    [SKTexture textureWithImageNamed:@"ship-morph0027"],
                    [SKTexture textureWithImageNamed:@"ship-morph0028"],
                    [SKTexture textureWithImageNamed:@"ship-morph0029"],
                    [SKTexture textureWithImageNamed:@"ship-morph0030"],
                    [SKTexture textureWithImageNamed:@"ship-morph0031"],
                    [SKTexture textureWithImageNamed:@"ship-morph0032"],
                    [SKTexture textureWithImageNamed:@"ship-morph0033"],
                    [SKTexture textureWithImageNamed:@"ship-morph0034"],
                    [SKTexture textureWithImageNamed:@"ship-morph0035"],
                    [SKTexture textureWithImageNamed:@"ship-morph0036"],
                    [SKTexture textureWithImageNamed:@"ship-morph0037"],
                    [SKTexture textureWithImageNamed:@"ship-morph0038"],
                    [SKTexture textureWithImageNamed:@"ship-morph0039"],
                    [SKTexture textureWithImageNamed:@"ship-morph0040"]];
    SKAction *animation = [SKAction animateWithTextures:newTextures timePerFrame:0.05];
    [fighterJetAnimated runAction:animation withKey:@"fighterJetInTitleScreenAnimation"];
    
    //[fighterJetAnimated runAction:[SKAction repeatActionForever:animation] withKey:@"animation"];
    
    
    
    
     return  fighterJetAnimated;
}

#pragma mark - Physics Properites
- (void) setupPhysicsBody {
    //self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:(CGPathRef) bodyWithRectangleOfSize:self.frame.size];
    CGFloat offsetX = self.frame.size.width * self.anchorPoint.x;
    CGFloat offsetY = self.frame.size.height * self.anchorPoint.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 19 - offsetX, 73 - offsetY);
    CGPathAddLineToPoint(path, NULL, 28 - offsetX, 73 - offsetY);
    CGPathAddLineToPoint(path, NULL, 39 - offsetX, 57 - offsetY);
    CGPathAddLineToPoint(path, NULL, 39 - offsetX, 37 - offsetY);
    CGPathAddLineToPoint(path, NULL, 49 - offsetX, 37 - offsetY);
    CGPathAddLineToPoint(path, NULL, 49 - offsetX, 9 - offsetY);
    CGPathAddLineToPoint(path, NULL, 30 - offsetX, 9 - offsetY);
    CGPathAddLineToPoint(path, NULL, 29 - offsetX, 0 - offsetY);
    CGPathAddLineToPoint(path, NULL, 18 - offsetX, 0 - offsetY);
    CGPathAddLineToPoint(path, NULL, 18 - offsetX, 7 - offsetY);
    CGPathAddLineToPoint(path, NULL, 0 - offsetX, 8 - offsetY);
    CGPathAddLineToPoint(path, NULL, 0 - offsetX, 37 - offsetY);
    CGPathAddLineToPoint(path, NULL, 9 - offsetX, 39 - offsetY);
    CGPathAddLineToPoint(path, NULL, 9 - offsetX, 59 - offsetY);
    CGPathAddLineToPoint(path, NULL, 19 - offsetX, 73 - offsetY);
    CGPathAddLineToPoint(path, NULL, 32 - offsetX, 72 - offsetY);
    CGPathAddLineToPoint(path, NULL, 35 - offsetX, 72 - offsetY);
    CGPathAddLineToPoint(path, NULL, 38 - offsetX, 65 - offsetY);
    
    CGPathCloseSubpath(path);
    
    self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
    
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.categoryBitMask = MJCollisionCategoryFlyingJet;
    self.physicsBody.collisionBitMask = MJCollisionCategoryDebris;
    self.physicsBody.contactTestBitMask = MJCollisionCategoryRock;
    
}


@end
