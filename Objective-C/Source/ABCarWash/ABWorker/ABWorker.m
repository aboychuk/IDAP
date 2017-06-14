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

@end

@implementation ABWorker

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.name = nil;
    self.queue = nil;
    
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
    self.state = ABWorkerBusy;
        
    [self takeMoneyFromObject:object];
    [self processScpecificOperations:object];
        
    self.state = ABWorkerReadyForProcess;
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
    NSLog(@"%@ got %lu USD from the %@", [self class], object.money, [object class]);
    [self takeMoney:[object giveMoney]];
}

#pragma mark
#pragma mark ABWorkerObserver Methods

- (void)workerDidBecomeReadyForProcess:(ABWorker*)worker {
        [self processObject:worker];
        self.state = ABWorkerFree;

}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABWorkerBusy:
            return @selector(workerDidBecomeBusy:);
            
        case ABWorkerFree:
            return @selector (workerDidBecomeFree:);
            
        case ABWorkerReadyForProcess:
            return @selector(workerDidBecomeReadyForProcess:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
