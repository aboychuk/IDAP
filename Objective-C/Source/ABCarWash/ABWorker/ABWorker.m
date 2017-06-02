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

@interface ABWorker ()
@property (nonatomic, assign)   NSUInteger  money;

- (void)processScpecificOperations:(id<ABMoneyFlow>)object;

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
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)processObject:(id<ABMoneyFlow>)object {
    self.state = ABWorkerBusy;
    [self processScpecificOperations:object];
    [self takeMoneyFromObject:object];
    self.state = ABWorkerFree;
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
    NSLog(@"%@ got %lu USD from the %@",
          NSStringFromClass([self class]),
          self.money,
          NSStringFromClass([object class]));

}

#pragma mark
#pragma mark - ABWorkerObserver Methods

- (void)workerDidFinishWork:(id<ABMoneyFlow>)object {
    NSLog(@"%@ worker finish work. %@", object, self);
    return [self processObject:object];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABWorkerBusy:
            return @selector(workerDidStartWork:);
            
        case ABWorkerFree:
            return @selector (workerDidFinishWork:);
            
        default:
            return [super selectorForState:state];
    }
}


@end
