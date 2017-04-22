//
//  main.m
//  Objective-C
//
//  Created by Andrew Boychuk on 19.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABCreature.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ABCreature *creature1 = [[ABCreature new] autorelease];
        ABCreature *creature2 = [[ABCreature new] autorelease];
        ABCreature *creature3 = [[ABCreature new] autorelease];
        ABCreature *creature4 = [[ABCreature new] autorelease];
        ABCreature *child1 = [[ABCreature new] autorelease];
        
        
        creature1.age = 23;
        creature1.name = @"Creature1";
        creature1 = Male;
        [creature1 sayHello];
    
        NSArray *creatureArray = [NSArray arrayWithObjects:creature1, creature2, creature3, creature4, nil];
    }
    return 0;
}
