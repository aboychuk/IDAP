//
//  ABBuilding.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABBuilding.h"

@interface ABBuilding ()
@property (nonatomic, retain)   NSMutableArray  *mutableRooms;

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
    self = [super init];
    if (self) {
        self.mutableRooms = [NSMutableArray array];
    }
    return self;
}

#pragma mark
#pragma mark Accesors

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)addRoom:(ABRoom *)room {
    if (room) {
    [self.mutableRooms addObject:room];
    }
}

- (void)removeRoom:(ABRoom *)room {
    [self.mutableRooms removeObject:room];
}

#pragma mark
#pragma mark Private Methods

- (NSArray *)findWorkersOfClassInRooms:(Class)cls {
    NSMutableArray *workers = [NSMutableArray array];
    for (ABRoom *room in self.mutableRooms) {
        [workers addObjectsFromArray:[room.workers filteredObjectsWithClass:cls]];
    }
    
    return [NSArray arrayWithArray:workers];
}

@end
