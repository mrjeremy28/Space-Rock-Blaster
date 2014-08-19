//
//  MJHudNode.m
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import "MJHudNode.h"
#import "MJSettings.h"

@implementation MJHudNode

+ (instancetype) hudAtPosition:(CGPoint)position inFrame:(CGRect)frame {
    MJHudNode *hud = [self node];
    hud.name = @"HUD";
    hud.position = position;
    hud.zPosition = 21;
    hud.lives = MJMaxLives;
    
    
    for (int i=0; i < hud.lives; i++) {
    SKSpriteNode *emptyShip = [SKSpriteNode spriteNodeWithImageNamed:@"lifeEmpty"];
    emptyShip.position = CGPointMake(20 + (i*20), -10);
        
    emptyShip.zPosition = 22;
    
    //[hud addChild:emptyShip];
    }
    
    SKSpriteNode *lastLifeShip;
    
    for (int i=0; i < hud.lives; i++) {
        SKSpriteNode *lifeShip = [SKSpriteNode spriteNodeWithImageNamed:@"life"];
        SKSpriteNode *emptyShip = [SKSpriteNode spriteNodeWithImageNamed:@"lifeEmpty"];
        
        lifeShip.name = [NSString stringWithFormat:@"Life%d", i+1];
        lifeShip.zPosition = 23;
        lifeShip.anchorPoint = CGPointMake(0,0);
        emptyShip.anchorPoint = CGPointMake(0,0);
        emptyShip.zPosition = 22;
        
        if (lastLifeShip == nil) {
            lifeShip.position = CGPointMake(hud.position.x+20, -10);
            emptyShip.position = CGPointMake(hud.position.x+20, -10);
        } else {
            lifeShip.position = CGPointMake(lastLifeShip.position.x+17, lastLifeShip.position.y);
            emptyShip.position = CGPointMake(lastLifeShip.position.x+17, lastLifeShip.position.y);
        }
        [hud addChild:lifeShip];
        [hud addChild:emptyShip];
        lastLifeShip = lifeShip;
    }

    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Orbitron-Regular"];
    scoreLabel.name = @"Score";
    scoreLabel.text = @"000";
    scoreLabel.fontSize = 22;
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    scoreLabel.position = CGPointMake(frame.size.width - 20, -10);
    
    [hud addChild:scoreLabel];
    
    return hud;
}

- (BOOL) loseLife {
    if (self.lives > 0) {
        NSString *lifeNodeName = [NSString stringWithFormat:@"Life%d",self.lives];
        SKNode *lifeToRemove = [self childNodeWithName:lifeNodeName];
        [lifeToRemove removeFromParent];
        self.lives--;
    }
    
    return self.lives == 0;
}

- (void) addPoints:(NSInteger)points {
    self.score += points;
    
    SKLabelNode *scoreLabel = (SKLabelNode*)[self childNodeWithName:@"Score"];
    scoreLabel.text = [NSString stringWithFormat:@"%d",self.score];
    
}


@end






