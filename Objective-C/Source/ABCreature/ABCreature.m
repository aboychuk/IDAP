//
//  ABCreature.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 20.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"

@interface ABCreature()

@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation ABCreature

@dynamic children;

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableChildren = nil;
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init {
    [super init];
    if (self) {
        self.name = [NSString randomStringWithLength:10];
        self.weight = [NSNumber randomNumberBetweenMin:40 max:120];
        self.age = [NSNumber randomNumberBetweenMin:18 max:100];
        self.mutableChildren = [NSMutableArray array];
    }
    return self;
}

#pragma mark
#pragma mark Accesors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)sayHello {
    NSLog(@"Hello from %@!", self.name);
    for (ABCreature* child in self.children) {
        [child sayHello];
    }
}

- (void)addChild:(ABCreature *)child {
    [self.mutableChildren addObject:child];
}

- (void)deleteChild:(ABCreature *)child {
    [self.mutableChildren removeObject:child];
}

- (void)performGenderSpecificOperation {
    
}

@end

