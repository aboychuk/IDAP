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

- (void)processObject:(ABAcountant*)accountant {
    self.state = ABWorkerBusy;
    [self takeMoneyFromObject:accountant];
    [self processScpecificOperations:accountant];
    accountant.state = ABWorkerFree;
    self.state = ABWorkerFree;
}

- (void)processScpecificOperations:(id<ABMoneyFlow>)object {
    [self takeProfit];
}

- (void)takeProfit {
    NSLog(@"Director got %lu", self.money);
}

@end
