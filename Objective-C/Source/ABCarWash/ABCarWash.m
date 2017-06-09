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
@property (nonatomic, retain)   ABQueue         *washers;
@property (nonatomic, retain)   ABQueue         *carsQueue;

@end

@implementation ABCarWash

#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.accountant = nil;
    self.director = nil;
    self.washers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.washers = [ABQueue object];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark -
#pragma mark - Public Methods

- (void)startWashing:(ABCar *)car {
    [self.carsQueue addObjectToQueue:car];
    
    ABCarWasher *washer = [self.washers popObjectFromQueue];
    
    [washer processObject:car];
}

#pragma mark -
#pragma mark - Private Methods

- (void)setCarWashHierarchy {
    self.accountant = [ABAcountant object];
    self.director = [ABDirector object];

    NSArray * washers = [ABCarWasher objectsWithCount:ABRandomWithMaxValue(ABWashersCountMax)];
    
    for (ABCarWasher *washer in washers) {
        [self.washers addObjectToQueue:washer];
        [washer addObserver:self.accountant];
        [washer addObserver:self];
    }
    
    [self.accountant addObserver:self.director];

}

@end
