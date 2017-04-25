//
//  main.m
//  Objective-C
//
//  Created by Andrew Boychuk on 19.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool{
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
    
    return 0;
}

