//
//  packetButton.h
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface packetButton : SKSpriteNode
+(void)addButton: (SKScene*)s;
+(void)onTouch: (SKSpriteNode*)obj scene:(SKScene*)s;
+(void)reCreate: (SKScene*)s;
@end