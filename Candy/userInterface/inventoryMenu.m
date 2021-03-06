//
//  inventoryMenu.m
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventoryMenu.h"
#import "menuBacking.h"
#import "inventoryButton.h"
#import "menuBackButton.h"
#import "slotManager.h"
#import "skUiItems.h"

@implementation inventoryMenu

bool created = false;

+(void)menuActions: (SKScene *)s inScene:(bool)in{

    SKSpriteNode *main = (SKSpriteNode *)[menuBacking createBacking];
    main.position = CGPointMake(0, -s.frame.size.height);
    main.name = @"menuInventory";
    
    [skUiItems addSkUI:main];
    [s addChild:main];

    SKSpriteNode *main_ = (SKSpriteNode*)[s childNodeWithName:@"menuInventory"];
    
    if(in){
        [self createMenu:s node:main_];
    }else if(!in) {
        [self removeMenu:s node:main_];
    }
}

+(void)createMenu: (SKScene *)s node:(SKSpriteNode *)main {
    
    SKAction *slideUp = [SKAction moveToY:(main.position.y+s.frame.size.height) duration:0.3];
    [main runAction:slideUp completion:^{
        [menuBackButton createButton:s];
    }];
}

+(void)removeMenu: (SKScene *)s node:(SKSpriteNode*)m {
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuInventory"];
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.3];
    [main runAction:slideDown completion:^{
            [menuBackButton removeButton:s];
        
            [main removeFromParent];
    }];
}

@end
