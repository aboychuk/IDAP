//
//  ABCarWashController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/21/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashController.h"

#import "ABDispatcher.h"
#import "ABQueue.h"
#import "ABCar.h"
#import "ABCarWasher.h"

@interface ABCarWashController ()
@property (nonatomic, retain)   ABDispatcher    *washersDispatcher;
@property (nonatomic, retain)   ABDispatcher    *accountantDispatcher;
@property (nonatomic, retain)   ABDispatcher    *directorDispatcher;

@end

@implementation ABCarWashController

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.washersDispatcher = nil;
    self.accountantDispatcher = nil;
    self.directorDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washersDispatcher = [ABDispatcher object];
        self.accountantDispatcher = [ABDispatcher object];
        self.directorDispatcher = [ABDispatcher object];
    }
    
    return self;
}

#pragma mark
#pragma mark - Public Methods

- (void)washCars:(NSArray *)cars {
    for (ABCar *car in cars) {
        [self.washersDispatcher takeObjectForProcessing:car];
    }
}

#pragma mark
#pragma mark Private Methods

- (void)setCarWashHierarchy {

}


@end
