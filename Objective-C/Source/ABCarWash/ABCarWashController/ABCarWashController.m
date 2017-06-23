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

- (void)createCarsQueue:(ABCar *)car {
    [self.carsQueue addObjectToQueue:car];
}

- (void)washCars {
    @synchronized (self) {
        ABCarWasher *washer = [self.washersQueue popObjectFromQueue];
        if (washer) {
            ABCar *car = [self.carsQueue popObjectFromQueue];
            if (car) {
                [washer processObject:car];
            } else {
                [self.carsQueue addObjectToQueue:car];
            }
        }
    }
}

#pragma mark
#pragma mark ABWorkerObserver Methods

- (void)workerDidBecomeFree:(ABWorker*)worker {
    @synchronized (self) {
        ABCar *car = [self.carsQueue popObjectFromQueue];
        if (car) {
            [worker processObject:car];
        } else {
            [self.washersQueue addObjectToQueue:worker];
        }
    }
}

@end
