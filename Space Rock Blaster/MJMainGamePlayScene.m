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
            [_selectedNode removeAllActions];
            SKAction *sequence = [SKAction sequence:@[[SKAction rotateByAngle:degToRad(-4.0f) duration:0.1],
                                                      [SKAction rotateByAngle:0.0 duration:0.1],
                                                      [SKAction rotateByAngle:degToRad(4.0f) duration:0.1]]];
            //[_selectedNode runAction:[SKAction repeatActionForever:sequence] withKey:@"Wiggle"];
        }
    }
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
        self.timeSinceFighterMoved = 0;
    }
    self.lastUpdateTimeInterval = currentTime;
    
  
    //MJFighterJet *projectile = [MJFighterJet projectileAtPosition:CGPointMake(machine.position.x, machine.position.y + machine.frame.size.height - 15 )];
    //[self addChild:projectile];
    
    //[projectile moveTowardsPosition:position];
    
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










