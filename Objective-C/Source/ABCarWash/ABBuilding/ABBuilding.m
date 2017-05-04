//
//  ABBuilding.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABBuilding.h"

@interface ABBuilding ()

@property(nonatomic, retain)NSMutableArray *mutableRooms;

@end

@implementation ABBuilding

@dynamic rooms;

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    [super init];
    if (self) {
        self.mutableRooms = [NSMutableArray array];
    }
    return self;
}

#pragma mark
#pragma mark Public Methods

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}


- (void)addRoom:(ABRoom *)room {
    [self.mutableRooms addObject:room];
}

- (void)deleteRoom:(ABRoom *)room {
    [self.mutableRooms removeObject:room];
}

@end
