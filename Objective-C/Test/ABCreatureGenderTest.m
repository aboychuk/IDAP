//
//  ABCreatureGenderTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 26.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreatureGenderTest.h"
#import "ABCreature.h"
#import "ABCreatureTest.h"
#import "ABCreatureMale.h"
#import "ABCreatureFemale.h"
#import "NSObject+ABCreatureCategory.h"

@implementation ABCreatureGenderTest

void CreatureGenderTest() {
    
    const int count = 10;
    
    NSMutableArray *creatures = [[NSMutableArray new] autorelease];
    
    for (int i = 0; i < count; i++) {
        ABCreatureMale *creatureMale = [ABCreatureMale objectCreate];
        ABCreatureFemale *creatureFemale = [ABCreatureFemale objectCreate];
        [creatures addObject:creatureMale];
        [creatures addObject:creatureFemale];
    }
    NSLog(@"array = %@", creatures);
    
    for (ABCreature *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
}

@end
