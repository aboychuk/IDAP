//
//  main.m
//  Objective-C
//
//  Created by Andrew Boychuk on 19.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"
#import "ABCreatureTest.h"
#import "ABCreatureMale.h"
#import "ABCreatureFemale.h"
#import "NSObject+ABCreatureCategory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool{
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
    
    return 0;
}

