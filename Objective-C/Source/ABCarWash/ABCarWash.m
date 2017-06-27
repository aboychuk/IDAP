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
@property (nonatomic, retain)   ABCarWashController *controller;


@end

@implementation ABCarWash

#pragma mark 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.controller = nil;

    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
    self.controller = [ABCarWashController object];
    }
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)washCars:(NSArray *)cars{
    [self.controller washCars:cars];
}

@end
