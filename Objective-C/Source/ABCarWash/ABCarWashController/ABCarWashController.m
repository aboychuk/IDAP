//
//  ABCarWashController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashController.h"

#import "ABCar.h"
#import "ABCarWashEnterprice.h"

#import "NSTimer+ABWeakReferenceTimer.h"


static NSUInteger ABCarsCount       = 5;
static NSTimeInterval ABTimerCount  = 1;

@interface ABCarWashController ()
@property (nonatomic, retain)   ABCarWashEnterprice *enterprice;
@property (nonatomic, retain)   NSTimer             *timer;

- (void)start;
- (void)stop;

@end

@implementation ABCarWashController
#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprice = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.enterprice = [ABCarWashEnterprice object];
        [self start];
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

- (void)setRunning:(BOOL)running {
    if (_running != running) {
        _running = running;
        [self prepareTimer];
    }
}

#pragma mark
#pragma mark Private Methods

- (void)start {
    self.running = YES;
}

- (void)stop {
    self.running = NO;
}

- (void)prepareTimer {
    if ([self isRunning]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:ABTimerCount
                                                  weakTarget:self
                                                    selector:@selector(fireTimer:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)fireTimer:(NSTimer *)timer {
    NSArray *cars = [ABCar objectsWithCount:ABCarsCount];
    [self.enterprice performSelectorInBackground:@selector(processCars:)
                                      withObject:cars];
}

@end
