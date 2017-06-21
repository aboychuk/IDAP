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



#pragma mark
#pragma mark Private Methods

- (void)setCarWashHierarchy {
    self.accountant = [ABAcountant object];
    self.director = [ABDirector object];
    
    self.washers = [ABCarWasher objectsWithCount:ABRandomWithMaxValue(ABWashersCountMax)];
    
    for (ABCarWasher *washer in self.washers) {
        [washer addObserver:self.accountant];
        [washer addObserver:self];
        [self.washersQueue addObjectToQueue:washer];
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
