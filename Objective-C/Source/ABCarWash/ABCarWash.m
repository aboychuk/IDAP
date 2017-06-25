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
    self.carsQueue = [ABQueue object];
    self.accountant = [ABAcountant object];
    self.director = [ABDirector object];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)washCar:(ABCar *)car {
    ABCarWasher *washer = [self.washersQueue popObjectFromQueue];
    if (washer) {
        [washer processObject:car];
    } else {
        [self.carsQueue addObjectToQueue:car];
    }
}

#pragma mark
#pragma mark Private Methods

- (void)setCarWashHierarchy {
    ABAcountant *accountant = self.accountant;
    
    self.washers = [NSArray objectsWithCount:ABRandomWithMaxValue(ABWashersCountMax)
                                factoryBlock:^id{
                                            ABCarWasher *washer = [ABCarWasher object];
                                            [washer addObserver:accountant];
                                            [washer addObserver:self];
                                            [self.washersQueue addObjectToQueue:washer];
                                    
                                            return washer;
                                        }];
    
    [accountant addObserver:self.director];

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
    ABCar *car = [self.carsQueue popObjectFromQueue];
    if (car) {
        [worker processObject:car];
    } else {
        [self.washersQueue addObjectToQueue:worker];
    }
}

@end
