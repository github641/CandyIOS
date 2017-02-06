//
//  candyMachineUI.h
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIKit.h>
@interface candyMachineUI : SKSpriteNode
+(void)createCandyMachineUIWithID: (int)machineID scene:(SKScene*)s view:(UIView*)v;
+(int)getSelectedSlot;
+(void)resetSelectedSlot;
@end
