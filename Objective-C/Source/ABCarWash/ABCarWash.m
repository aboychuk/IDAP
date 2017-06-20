//
//  ABCarWash.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWash.h"

static NSUInteger ABWashersCountMax = 9;

@interface ABCarWash ()
@property (nonatomic, retain)   ABAcountant     *accountant;
@property (nonatomic, retain)   ABDirector      *director;
@property (nonatomic, retain)   ABQueue         *washersQueue;
@property (nonatomic, retain)   ABQueue         *carsQueue;
@property (nonatomic, retain)   NSArray         *washers;

@end

@implementation ABCarWash

#pragma mark 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeObservers];

    self.accountant = nil;
    self.director = nil;
    self.washersQueue = nil;
    self.carsQueue = nil;
    self.washers = nil;

    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.washersQueue = [ABQueue object];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)washCar:(ABCar *)car {
    if (car) {
        ABCarWasher *washer = [self.washersQueue popObjectFromQueue];
        if (washer) {
            [washer processObject:car];
        }
    }
}

#pragma mark
#pragma mark Private Methods

- (void)setCarWashHierarchy {
    self.accountant = [ABAcountant object];
    self.director = [ABDirector object];
    
    self.washers = [ABCarWasher objectsWithCount:ABRandomWithMaxValue(ABWashersCountMax)];
    
    for (ABCarWasher *washer in self.washers) {
        [self.washersQueue addObjectToQueue:washer];
        [washer addObserver:self.accountant];
        [washer addObserver:self];
    }
    
    [self.accountant addObserver:self.director];

}

- (void)removeObservers {
    for (ABCarWasher *washer in self.washers) {
        [washer removeObserver:self.accountant];
        [washer removeObserver:self];
    }
    
    [self.accountant removeObserver:self.director];
}

#pragma mark
#pragma mark ABWorkerObserver Methods

- (void)workerDidBecomeFree:(ABWorker*)worker {
    NSLog(@"%@ nitified %@ about status", worker, self);
    [self.washersQueue addObjectToQueue:worker];
}

@end
