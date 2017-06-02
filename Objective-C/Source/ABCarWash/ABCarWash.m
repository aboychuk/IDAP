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
    self.washers = [NSArray array];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark -
#pragma mark - Public Methods

- (void)startWashing:(ABCar *)car {
    NSUInteger max = [self.washers count];
    ABCarWasher *washer = self.washers[ABRandomWithMaxValue(max - 1)];
    
    [washer processObject:car];
    [self.accountant processObject:washer];
    [self.director processObject:self.accountant];
}

#pragma mark -
#pragma mark - Private Methods

- (void)setCarWashHierarchy {
    self.accountant = [ABAcountant object];
    self.director = [ABDirector object];
    self.washers = [ABCarWasher objectsWithCount:ABRandomWithMaxValue(ABWashersCountMax)];
    
    [self.accountant addObserver:self.director];
    
    for (ABCarWasher *washer in self.washers) {
        [washer addObserver:self.accountant];
        [washer addObserver:self];
    }
}

@end
