//
//  ABCarWash.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWash.h"

#import "ABCar.h"
#import "ABCarWashController.h"

#import "NSTimer+ABWeakReferenceTimer.h"

static NSUInteger       ABCarsCount = 5;
static NSTimeInterval   ABTimerCount = 1;

@interface ABCarWash ()
@property (nonatomic, retain)   ABCarWashController *controller;
@property (nonatomic, retain)   NSTimer             *timer;

@end

@implementation ABCarWash

#pragma mark 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.controller = nil;
    self.timer = nil;

    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.controller = [ABCarWashController object];
        [self start];
        [self prepareTimer];
    }
    
    return self;
}

#pragma mark
#pragma mark Accesors

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer release];
        [_timer invalidate];
        _timer = [timer retain];
    }
}

- (void)start {
    self.running = YES;
}

- (void)stop {
    self.running = NO;
}

#pragma mark
#pragma mark Public Methods

- (void)washCars:(NSArray *)cars {
    [self.controller processCars:cars];
}

- (void)prepareTimer {
    if (self.running == YES) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:ABTimerCount
                                                  weakTarget:self
                                                    selector:@selector(fireTimer:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)fireTimer:(NSTimer *)timer {
    NSArray *cars = [ABCar objectsWithCount:ABCarsCount];
    [self performSelectorInBackground:@selector(washCars:)
                           withObject:cars];
}


@end
