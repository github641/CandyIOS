//
//  dynamicBackgrounds.m
//  Candy
//
//  Created by Callum Beckwith on 06/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "dynamicBackgrounds.h"
#import "buildingType.h"
#import "settingsData.h"

@implementation dynamicBackgrounds
+(void)addDynamicBackground: (SKScene*)s {
    [self addSky:s];
    [self addCurrentBackdrop:s];
    if(![settingsData isFancyGraphicsEnabled]){
        [self addClouds:s];
    }
}
+(void)addCurrentBackdrop: (SKScene*)s {
    
    NSString *backdropTextureName;
    
    if([buildingType getCurrentBuildingID] < 3){
        backdropTextureName = @"estateBackdrop";
    }
    if([buildingType getCurrentBuildingID] > 2 && [buildingType getCurrentBuildingID] < 6){
        backdropTextureName = @"cityBackdrop";
    }
    if([buildingType getCurrentBuildingID] > 5 && [buildingType getCurrentBuildingID] < 10){
        backdropTextureName = @"factoryBackdrop";
 
    }
    
    SKSpriteNode *backdrop = [SKSpriteNode spriteNodeWithImageNamed:backdropTextureName];
    backdrop.size = CGSizeMake(s.frame.size.width, s.frame.size.height/5.5);
    backdrop.position = CGPointMake(0, s.frame.size.height/3.5);
    backdrop.zPosition = -6;
    [s addChild:backdrop];
}
//For having a day and night cycle just overlay the night time sprite with the day time and increase the opacity over time while moving the sun and moon sprites, may aswell do this after the main functions of the game are in because its is just astetically pleasing!
+(void)addSky: (SKScene*)s {
    SKSpriteNode *dayTime = [SKSpriteNode spriteNodeWithImageNamed:@"sky"];
    dayTime.size = CGSizeMake(s.frame.size.width, s.frame.size.height/1.5);
    dayTime.position = CGPointMake(0, s.frame.size.height/2 - dayTime.frame.size.height/2.5);
    dayTime.zPosition = -7;
    [s addChild:dayTime];
    
    SKAction *rotate = [SKAction rotateByAngle:M_PI*2 duration:600];
    SKAction *rep = [SKAction repeatActionForever:rotate];
    
    
    if(![settingsData isFancyGraphicsEnabled]){
        [dayTime runAction:rep];
    }
}
+(void)addClouds: (SKScene*)s {
    SKSpriteNode *cloud_1 = [SKSpriteNode spriteNodeWithImageNamed:@"xlouds"];
    
    cloud_1.xScale = 0.43;
    
    cloud_1.yScale = 0.43;
    
    cloud_1.zPosition = -6;
    
    cloud_1.position = CGPointMake(-s.frame.size.width, s.frame.size.height/2.65);
    
    [s addChild:cloud_1];
    
    SKAction *moveRight = [SKAction moveTo:CGPointMake(s.frame.size.width/2 + cloud_1.size.width, s.frame.size.height/2.65) duration:90];
    SKAction *posReset = [SKAction moveTo:CGPointMake(-s.frame.size.width/2-cloud_1.size.width, s.frame.size.height/2.65) duration:0];
    SKAction *seq = [SKAction sequence:@[moveRight, posReset]];
    SKAction *repeatSeq = [SKAction repeatActionForever:seq];
    
    [cloud_1 runAction:repeatSeq];

}
@end
