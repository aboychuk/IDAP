//
//  ABCarWash.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWash.h"

#import "ABCarWashController.h"

static NSUInteger ABWashersCountMax = 9;

@interface ABCarWash ()
@property (nonatomic, retain)   ABAcountant         *accountant;
@property (nonatomic, retain)   ABDirector          *director;
@property (nonatomic, retain)   NSArray             *washers;
@property (nonatomic, retain)   ABCarWashController *controller;


@end

@implementation ABCarWash

#pragma mark 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeObservers];

    self.accountant = nil;
    self.director = nil;
    self.washers = nil;
    self.controller = nil;

    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.accountant = [ABAcountant object];
    self.director = [ABDirector object];
    self.controller = [ABCarWashController object];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)washCars:(NSArray *)cars{
    [self.controller createCarsQueue:cars];
    [self.controller washCars];
}

#pragma mark
#pragma mark Private Methods

- (void)setCarWashHierarchy {
    self.washers = [NSArray objectsWithCount:ABRandomWithMaxValue(ABWashersCountMax)
                                factoryBlock:^id{
                                    ABCarWasher *washer = [ABCarWasher object];
                                    [washer addObserver:self.accountant];
                                    [washer addObserver:self.controller];
                                    
                                    return washer;
    }];
    
    [self.accountant addObserver:self.director];
    [self.controller createWashersQueue:self.washers];


}

- (void)removeObservers {
    for (ABCarWasher *washer in self.washers) {
        [washer removeObserver:self.accountant];
        [washer removeObserver:self.controller];
    }
    
    [self.accountant removeObserver:self.director];
}

@end
