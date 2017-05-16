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

- (void)addCarRoom:(ABCarWashRoom *)carRoom {
    if (carRoom) {
        [self.mutableRooms addObject:carRoom];
    }
}

- (void)removeCarRoom:(ABCarWashRoom *)carRoom {
    [self.mutableRooms removeObject:carRoom];
}

- (ABWorker *)objectOfClassWorker:(Class)class {
    for (ABRoom *room in self.rooms) {
        for (ABWorker *worker in room.workers) {
            if ([worker isKindOfClass:class]) {
                return worker;
            }
        }
    }
    
    return nil;
}

- (ABCar *)objectOfClassCar:(Class)class {
    for (ABCarWashRoom *room in self.rooms) {
        if ([room isKindOfClass:[ABCarWashRoom class]])
            for (ABCar *car in room.cars) {
                if ([car isKindOfClass:class]) {
                    return car;
                }
            }
    }
    
    return nil;
}

@end
