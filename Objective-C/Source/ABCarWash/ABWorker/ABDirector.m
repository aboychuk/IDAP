//
//  ABDirector.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDirector.h"
#import "ABAcountant.h"

@interface ABDirector ()

- (void)takeProfit;

@end

@implementation ABDirector

#pragma mark
#pragma mark Private Methods

- (void)processScpecificOperations:(id<ABMoneyFlow>)object {
    [self takeProfit];
}

- (void)takeProfit {
    NSLog(@"Director has %lu USD of profit!", self.money);
}

#pragma mark
#pragma mark ABWorkerObserver Methods

- (void)workerDidBecomeReadyForProcess:(ABWorker*)worker {
    [self processObject:worker];
    worker.state = ABWorkerFree;
    self.state = ABWorkerFree;
}

@end
