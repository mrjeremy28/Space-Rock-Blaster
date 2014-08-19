//
//  MJMainGamePlayScene.m
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import "MJMainGamePlayScene.h"
#import "MJFighterJet.h"
#import "MJFighterProjectileNode.h"
#import "MJGameOverNode.h"
#import "MJHudNode.h"
#import "MJSettings.h"
#import "MJFlyingRockNode.h"

static NSString * const kFighterNodeName = @"movable";


@interface MJMainGamePlayScene ()
@property (nonatomic, strong) SKSpriteNode *background;
@property (nonatomic, strong) SKSpriteNode *selectedNode;


@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) NSTimeInterval timeSinceFighterMoved;
@property (nonatomic) NSTimeInterval totalGameTime;
@property (nonatomic) NSTimeInterval fighterJetTimeInterval;
@property (nonatomic) BOOL fighterMovedRight;

@end

@implementation MJMainGamePlayScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.lastUpdateTimeInterval = 0;
        self.timeSinceFighterMoved = 0;
        self.fighterJetTimeInterval = 1.5;
        self.fighterMovedRight = 0;
        /* Setup your scene here */
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bg-stars_00"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        // background.anchorPoint = CGPointMake(0, 0);
        [self addChild:background];
        
        NSArray *backgroundTextures = @[[SKTexture textureWithImageNamed:@"bg-stars_00"],
                              [SKTexture textureWithImageNamed:@"bg-stars_01"],
                              [SKTexture textureWithImageNamed:@"bg-stars_02"],
                              [SKTexture textureWithImageNamed:@"bg-stars_03"],
                              [SKTexture textureWithImageNamed:@"bg-stars_04"],
                              [SKTexture textureWithImageNamed:@"bg-stars_05"],
                              [SKTexture textureWithImageNamed:@"bg-stars_06"],
                              [SKTexture textureWithImageNamed:@"bg-stars_07"],
                              [SKTexture textureWithImageNamed:@"bg-stars_08"],
                              [SKTexture textureWithImageNamed:@"bg-stars_09"],
                              [SKTexture textureWithImageNamed:@"bg-stars_10"],
                              [SKTexture textureWithImageNamed:@"bg-stars_11"],
                              [SKTexture textureWithImageNamed:@"bg-stars_12"],
                              [SKTexture textureWithImageNamed:@"bg-stars_13"],
                              [SKTexture textureWithImageNamed:@"bg-stars_14"],
                              [SKTexture textureWithImageNamed:@"bg-stars_15"],
                              [SKTexture textureWithImageNamed:@"bg-stars_16"],
                              [SKTexture textureWithImageNamed:@"bg-stars_17"],
                              [SKTexture textureWithImageNamed:@"bg-stars_18"]];
        
        SKAction *backgroundAnimation = [SKAction animateWithTextures:backgroundTextures timePerFrame:0.04];
        SKAction *repeatAction = [SKAction repeatActionForever:backgroundAnimation];
        [background runAction:repeatAction];

        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8);
        self.physicsWorld.contactDelegate = self;

        
        //add fighterJet Animated
        MJFighterJet *fighterJet = [MJFighterJet fighterAtPosition:(CGPointMake(CGRectGetMidX(self.frame), 60))];
        [fighterJet setName:kFighterNodeName];
        
        [self addChild:fighterJet];
        
        
        MJHudNode *hud = [MJHudNode hudAtPosition:CGPointMake(0, self.frame.size.height - 20) inFrame:self.frame];
        [self addChild:hud];
               
    }
    return self;
}

#pragma mark - Touches Functions
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */

    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    [self selectNodeForTouch:positionInScene];
    
    [self shootProjectileTowardsPosition:positionInScene];
    
//    for (UITouch *touch in touches) {
//        
//    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint positionInScene = [touch locationInNode:self];
	CGPoint previousPosition = [touch previousLocationInNode:self];
    
	CGPoint translation = CGPointMake(positionInScene.x - previousPosition.x, positionInScene.y - previousPosition.y);
    
	[self panForTranslation:translation];
}

#pragma mark - Helper functions
- (void) selectNodeForTouch:(CGPoint)touchLocation {
    //1 asks your scene(self) for the node that is on the position touched
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    
    //2 is node same as previous and wiggles if not
    if (![_selectedNode isEqual:touchedNode]) {
        [_selectedNode removeActionForKey:@"Wiggle"];
        [_selectedNode runAction:[SKAction rotateToAngle:0.0f duration:0.1]];
        
        _selectedNode = touchedNode;
        
        //3 if it is node, then wiggle it
        if([[touchedNode name] isEqualToString:kFighterNodeName]) {
//            [_selectedNode removeAllActions];
//            SKAction *sequence = [SKAction sequence:@[[SKAction rotateByAngle:degToRad(-4.0f) duration:0.1],
//                                                      [SKAction rotateByAngle:0.0 duration:0.1],
//                                                      [SKAction rotateByAngle:degToRad(4.0f) duration:0.1]]];
            //[_selectedNode runAction:[SKAction repeatActionForever:sequence] withKey:@"Wiggle"];
        } else {
            
            [self shootProjectileTowardsPosition:touchLocation];
        }
    }
}

-(void) shootProjectileTowardsPosition:(CGPoint)position {
//    MJSpaceKittyNode *spaceCat = (MJSpaceKittyNode*)[self childNodeWithName:@"SpaceCat"];
//    [spaceCat performTap];
    
    MJFighterJet *fighterJet = (MJFighterJet *)[self childNodeWithName:kFighterNodeName];
    
    MJFighterProjectileNode *projectile = [MJFighterProjectileNode projectileAtPosition:CGPointMake//(fighterJet.position.x, fighterJet.position.y + fighterJet.frame.size.height - 15 )
                                          (fighterJet.position.x,fighterJet.position.y+20)
                                           ];
   // NSLog(@"Fighter at %f",fighterJet.position.x);
    //NSLog(@"Clicked at %f",position.x);
   // projectile.position = CGPointMake(100, 100);
    
    [self addChild:projectile];
    
    [projectile moveTowardsPosition:fighterJet.position];
   // [self runAction:self.laserSFX];
    
}
- (void) loseLife {
    MJHudNode *hud = (MJHudNode*)[self childNodeWithName:@"HUD"];
    [hud loseLife];
}


float degToRad(float degree) {
	return degree / 180.0f * M_PI;
}


#pragma mark - Update Current FrameScene
-(void)update:(CFTimeInterval)currentTime {
    if (self.lastUpdateTimeInterval) {
        self.timeSinceFighterMoved += currentTime - self.lastUpdateTimeInterval;
        self.totalGameTime += currentTime - self.lastUpdateTimeInterval;
    }
    
    // 1.0 is pretty fast
    if (self.timeSinceFighterMoved > self.fighterJetTimeInterval ) {
       // [self moveFighterJet];
        [self addFlyingRock];
        self.timeSinceFighterMoved = 0;
    }
    self.lastUpdateTimeInterval = currentTime;
    
  
    //MJFighterJet *projectile = [MJFighterJet projectileAtPosition:CGPointMake(machine.position.x, machine.position.y + machine.frame.size.height - 15 )];
    //[self addChild:projectile];
    
    //[projectile moveTowardsPosition:position];
    
}

-(void) addFlyingRock {
    //    MJSpaceDogNode *spaceDogA = [MJSpaceDogNode spaceDogOfType:MJSpaceDogTypeA];
    //    spaceDogA.position = CGPointMake(100, 300);
    //    [self addChild:spaceDogA];
    //
    //    MJSpaceDogNode *spaceDogB = [MJSpaceDogNode spaceDogOfType:MJSpaceDogTypeB];
    //    spaceDogB.position = CGPointMake(200, 300);
    //    [self addChild:spaceDogB];
    //
    NSUInteger randomFlyingRock = [MJSettings randomWithMin:0 max:2];
    MJFlyingRockNode *FlyingRock = [MJFlyingRockNode flyingRockAtPosition:CGPointMake(25, -100)];
    
    float dy = [MJSettings randomWithMin:MJFlyingRockMinSpeed max:MJFlyingRockMaxSpeed];
    FlyingRock.physicsBody.velocity = CGVectorMake(0,dy);
    
    
    float y = self.frame.size.height + FlyingRock.size.height;
    float x = [MJSettings randomWithMin:10 + FlyingRock.size.width max:self.frame.size.width - FlyingRock.size.width - 10];
    
    FlyingRock.position = CGPointMake(x, y);
    [self addChild:FlyingRock];
    
    
}

-(void) moveFighterJet {
    /* Called before each frame is rendered */
    MJFighterJet *fighterJet = (MJFighterJet*)[self childNodeWithName:@"MainFighter"];
    
    if (self.fighterMovedRight == 0) {
        [fighterJet moveTowardsPositionRight:fighterJet.position screenEdge:self.frame.size.width];
        self.fighterMovedRight = 1;
    } else {
        [fighterJet moveTowardsPositionLeft:fighterJet.position];
        self.fighterMovedRight = 0;
    }
}


#pragma mark - Bounds for moving jet
- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGSize winSize = self.size;
    CGPoint retval = newPos;
    retval.x = MIN(retval.x,0);
    retval.x = MAX(retval.x, -[_background size].width+ winSize.width);
    retval.y = [self position].y;
    
    return retval;
}

- (void)panForTranslation:(CGPoint)translation {
    CGPoint position = [_selectedNode position];
    if([[_selectedNode name] isEqualToString:kFighterNodeName]) {
        [_selectedNode setPosition:CGPointMake(position.x + translation.x, position.y + translation.y)];
    } else {
        CGPoint newPos = CGPointMake(position.x + translation.x, position.y + translation.y);
        [_background setPosition:[self boundLayerPos:newPos]];
    }
    
}


@end










