//
//  ABWorker.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABWorker.h"

static NSUInteger ABWorkerSalary = 2000;
static NSUInteger maxExpirience = 10;
static NSUInteger nameLength = 6;

@interface ABWorker()
@property (nonatomic, assign)   NSUInteger  money;

- (void)processScpecificOperations:(id<ABMoneyFlow>)object;
- (void)processObjectFromQueue;

@end

@implementation ABWorker

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init{
    self = [super init];
    self.name = [NSString randomStringWithLength:nameLength];
    self.salary = ABWorkerSalary;
    self.experience = ABRandomWithMaxValue(maxExpirience);
    self.state = ABWorkerFree;
    self.queue = [ABQueue object];
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)processObject:(id<ABMoneyFlow>)object {
    if (self.state == ABWorkerFree) {
        self.state = ABWorkerBusy;
        [self takeMoneyFromObject:object];
        [self processScpecificOperations:object];
        self.state = ABWorkerReadyForProcess;
    }
}

- (void)processObjectFromQueue {
    while (self.queue) {
        id objectFromQueue = [self.queue popObjectFromQueue];
        [self processScpecificOperations:objectFromQueue];
        [self takeMoneyFromObject:objectFromQueue];
        self.state = ABWorkerReadyForProcess;
    }
}

- (void)processScpecificOperations:(id<ABMoneyFlow>)object {
    
}

#pragma mark
#pragma mark ABMoneyFlow Methods

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

- (void)takeMoneyFromObject:(id<ABMoneyFlow>)object {
    self.money += [object giveMoney];
    NSLog(@"%@ got %lu USD from the %@", [self class], self.money, [object class]);
}

#pragma mark
#pragma mark - ABWorkerObserver Methods

- (void)objectDidBecomeFree:(id<ABMoneyFlow>)object {
    
}

- (void)objectDidBecomeBusy:(id<ABMoneyFlow>)object {
}

- (void)objectDidBecomeReadyForProcess:(id<ABMoneyFlow>)object {
        [self processObject:object];
        self.state = ABWorkerFree;

}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABWorkerBusy:
            return @selector(objectDidBecomeBusy:);
            
        case ABWorkerFree:
            return @selector (objectDidBecomeFree:);
            
        case ABWorkerReadyForProcess:
            return @selector(objectDidBecomeReadyForProcess:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
