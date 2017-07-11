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

@interface ABCarWashController ()
@property (nonatomic, retain)   ABCarWashEnterprise *enterprise;

- (void)start;

@end

@implementation ABCarWashController
#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    
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

- (void)setRunning:(BOOL)running {
    if (_running != running) {
        _running = running;
    }
    
    running ? [self start] : 0;
}

#pragma mark
#pragma mark Private Methods

- (void)start {
    ABDispatchAfterDelayWithCondition(ABTimerCount, ^{
        NSArray *cars = [ABCar objectsWithCount:ABCarsCount];
                        [self.enterprise performSelector:@selector(processCars:)
                                              withObject:cars];

    },
                                      ^BOOL{
                                          return [self isRunning];
    });
}

@end
