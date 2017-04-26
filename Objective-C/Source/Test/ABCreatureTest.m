//
//  ABCreatureTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 26.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreatureTest.h"

@implementation ABCreatureTest

void CreatureTest() {
    
    const int count = 10;
    
    NSMutableArray *creaturesArray = [[NSMutableArray new] autorelease];
    
    for (int i = 0; i < count; i++) {
        ABCreature *creature = [[[ABCreature alloc] init]autorelease];
        ABCreature *child = [[[ABCreature alloc] init]autorelease];
        [creaturesArray addObject:creature];
        [creature sayHello];
        [creature addChild:child];
        NSLog(@"%@", creature.childrens);
    }
    
    for (ABCreature *creature in creaturesArray) {
        [creature sayHello];
        if (creature.gender == Male) {
            [creature goToWar];
        }else {
            [creature childBirth];
        }
    }
}

@end
