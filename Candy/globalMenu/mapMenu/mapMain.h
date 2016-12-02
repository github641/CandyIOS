//
//  mapMain.h
//  Candy
//
//  Created by Callum Beckwith on 01/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface mapMain : SKSpriteNode
+(void)mapNavigation: (CGPoint)p node:(SKSpriteNode*)s;
+(void)createMap: (SKScene*)s;
+(void)onRelease: (SKSpriteNode*)s point:(CGPoint)p scene:(SKScene*)sk;
@end
