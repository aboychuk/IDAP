//
//  ABAcountant.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAcountant.h"
#import "ABCarWasher.h"

@interface ABAcountant ()

- (void)calculateMoney;

@end

@implementation ABAcountant

#pragma mark
#pragma mark Private Methods

- (void)processObject:(ABCarWasher*)carWasher {
    self.state = ABWorkerBusy;
    [self takeMoneyFromObject:carWasher];
    [self processScpecificOperations:carWasher];
    self.state = ABWorkerReadyForProcess;
    carWasher.state = ABWorkerFree;
}

- (void)processScpecificOperations:(id<ABMoneyFlow>)object {
    [self calculateMoney];
}

- (void)calculateMoney {
    NSLog(@"Accountant calculated money.");
}

@end
