//
//  MJIntroScene.m
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import "MJIntroScene.h"
#import "MJMainGamePlayScene.h"
#import "MJFighterJet.h"

@implementation MJIntroScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
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
        
        
        
        // self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        //Title Node
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Orbitron-Bold"];
        
        titleLabel.text = @"ROCK BLASTER";
        titleLabel.fontSize = 24;
        titleLabel.name = @"TitleLabel";
        titleLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                          self.frame.size.height -100 );
        [self addChild:titleLabel];
        SKLabelNode *startLabel = [SKLabelNode labelNodeWithFontNamed:@"Orbitron-Regular"];
        
        startLabel.text = @"START GAME";
        startLabel.fontSize = 12;
        startLabel.name = @"StartLabel";
        startLabel.position = CGPointMake(CGRectGetMidX(self.frame),100 );
        [self addChild:startLabel];
        
        //add fighterJet Animated
        MJFighterJet *fighterJet = [MJFighterJet fighterJetInTitleScreenAtPosition:(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)))];
        [self addChild:fighterJet];
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    //[self runAction:self.pressStartSFX];
    //[self.backgroundMusic stop];
    //SKTransitionDirection *direction = [SKTransitionDirectionDown ];
    
    MJMainGamePlayScene *gamePlayScene = [MJMainGamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition //transitionWithCIFilter:(CIFilter *) duration:1.0 //
                                fadeWithDuration:1.0
                                ];
    //SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:1.0];
    
    [self.view presentScene:gamePlayScene transition:transition];
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
@end
