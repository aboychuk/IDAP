//
//  ABCreature.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 20.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"

@interface ABCreature()

@property (nonatomic,copy) NSMutableArray *mutableChildren;

@end

@implementation ABCreature
@dynamic children;

-(void)sayHello {
    NSLog(@"Hello from %@ !", self.name);
}

-(void)goToWar {
    NSLog(@"%@ went to war!", self.name);
}
-(void)addChild:(ABCreature*)child {
    [self.mutableChildren addObject:child];
}

-(void)deleteChild:(ABCreature*)child {
    [self.mutableChildren removeObject:child];
}

@end
