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
#import "ABGCDExtension.h"

#import "NSTimer+ABWeakReferenceTimer.h"


static NSUInteger ABCarsCount   = 5;
static NSUInteger ABTimerCount  = 2;
static NSString *GCDQueue       = @"ControllerGCDQueue";

@interface ABCarWashController ()
@property (nonatomic, retain)   ABCarWashEnterprise *enterprise;
@property (nonatomic, retain)   NSTimer             *timer;
@property (nonatomic, retain)   dispatch_queue_t    queue;

- (void)start;
- (void)stop;

@end

@implementation ABCarWashController
#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    dispatch_release(self.queue);
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.enterprise = [ABCarWashEnterprise object];
        self.queue = createConcurrentDispatchQueue(GCDQueue);
    }
    
    return self;
}

#pragma mark
#pragma mark Accesors

- (void)setRunning:(BOOL)running {
    if (_running != running) {
        _running = running;
    }
    
    running ? [self start] : [self stop];
}

#pragma mark
#pragma mark Private Methods

- (void)start {
    if ([self isRunning]) {
        dispatchAfterCount(ABTimerCount, self.queue, ^{
            dispatchAsyncInBackgroundThread(self.queue,^{
                NSArray *cars = [ABCar objectsWithCount:ABCarsCount];
                [self.enterprise performSelector:@selector(processCars:)
                                      withObject:cars];
            });
            [self start];
        });
    }
}

- (void)stop {
    
}

@end
