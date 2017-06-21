//
//  ABCarWashController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/21/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashController.h"

#import "ABQueue.h"
#import "ABCar.h"
#import "ABCarWasher.h"

@interface ABCarWashController ()
@property (nonatomic, retain)   ABQueue         *washersQueue;
@property (nonatomic, retain)   ABQueue         *carsQueue;

@end

@implementation ABCarWashController

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.carsQueue = nil;
    self.washersQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washersQueue = [ABQueue object];
        self.carsQueue = [ABQueue object];
    }
    
    return self;
}

#pragma mark
#pragma mark - Public Methods

- (void)createWashersQueue:(NSArray*)washers {
    for (ABCarWasher *washer in washers) {
        [self.washersQueue addObjectToQueue:washer];
    }
}

- (void)createCarsQueue:(NSArray*)cars {
    for (ABCar *car in cars) {
        [self.carsQueue addObjectToQueue:car];
    }
}

- (void)washCars {
    
}

@end
