//
//  ABCarWashRoom.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashRoom.h"

@interface ABCarWashRoom ()
@property (nonatomic, retain)   NSMutableArray  *mutableCars;

@end

@implementation ABCarWashRoom

@dynamic cars;

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCars = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark
#pragma mark Accesors

- (NSArray *) cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)addCar:(ABCar *)car {
    [self.mutableCars addObject:car];
}

- (void)removeCar:(ABCar *)car {
    [self.mutableCars removeObject:car];
}

@end
