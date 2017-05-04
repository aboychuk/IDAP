//
//  ABRoom.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABRoom.h"

@interface ABRoom ()

@property(nonatomic, retain)NSMutableArray  *mutableHumans;

@end

@implementation ABRoom

@dynamic humans;

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableHumans = nil;
    
    [super dealloc];
}

- (instancetype)init {
    [super init];
    if (self) {
        self.mutableHumans = [NSMutableArray array];
    }
    return self;
}
#pragma mark
#pragma mark Accesors

- (NSArray *)rooms {
    return [[self.mutableHumans copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)addHuman:(ABHuman *)human {
    [self.mutableHumans addObject:human];
}

- (void)removeHuman:(ABHuman *)human {
    [self.mutableHumans removeObject:human];
}

@end
