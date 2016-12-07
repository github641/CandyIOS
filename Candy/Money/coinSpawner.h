//
//  coinSpawner.h
//  Candy
//
//  Created by Callum Beckwith on 03/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface coinSpawner : SKSpriteNode
+(void)spriteToSpriteSpawner: (SKSpriteNode*)s1 sprite2:(SKSpriteNode*)s2 scene:(SKScene*)s;
+(void)coinExplosion: (SKSpriteNode*)s1 scene:(SKScene*)s coinAmount:(int)coinNo;
@end
