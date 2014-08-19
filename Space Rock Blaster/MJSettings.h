//
//  MJSettings.h
//  Space Rock Blaster
//
//  Created by Jeremy Adams on 8/17/14.
//  Copyright (c) 2014 MrJeremy. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int MJProjectileSpeed = 400;
static const int MJFlyingRockMinSpeed = -100;
static const int MJFlyingRockMaxSpeed = -50;
static const int MJMaxLives = 3;
static const int MJPointsPerHit = 100;



typedef NS_OPTIONS(uint32_t, MJCollisionCategory) {
    MJCollisionCategoryRock         = 1 << 0,   //0000
    MJCollisionCategoryMissle       = 1 << 1,   //0010
    MJCollisionCategoryDebris       = 1 << 2,   //0100
    MJCollisionCategoryFlyingJet    = 1 << 3    //1000
};


@interface MJSettings : NSObject

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max;

@end
