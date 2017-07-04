//
//  ABCarWashController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashController.h"

#import "ABCar.h"
#import "ABCarWashEnterprise.h"

#import "NSTimer+ABWeakReferenceTimer.h"


static NSUInteger ABCarsCount       = 5;
static NSTimeInterval ABTimerCount  = 1;

@interface ABCarWashController ()
@property (nonatomic, retain)   ABCarWashEnterprise *enterprise;
@property (nonatomic, retain)   NSTimer             *timer;

- (void)start;
- (void)stop;

@end

@implementation ABCarWashController
#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.enterprise = [ABCarWashEnterprise object];
    }
    
    return self;
}

#pragma mark
#pragma mark Accesors

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer invalidate];
        [_timer release];
        _timer = [timer retain];
    }
}

- (void)setRunning:(BOOL)running {
    if (_running != running) {
        _running = running;
    }
    
    running ? [self start] : [self stop];
}

#pragma mark
#pragma mark Public Methods

- (void)start {
    if ([self isRunning]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:ABTimerCount
                                                  weakTarget:self
                                                    selector:@selector(fireTimer:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)stop {
    if (![self isRunning]) {
        self.timer = nil;
    }
}

#pragma mark
#pragma mark Private Methods


- (void)fireTimer:(NSTimer *)timer {
    if ([self isRunning]) {
        NSArray *cars = [ABCar objectsWithCount:ABCarsCount];
        [self.enterprise performSelectorInBackground:@selector(processCars:)
                                          withObject:cars];
    }
}

@end
