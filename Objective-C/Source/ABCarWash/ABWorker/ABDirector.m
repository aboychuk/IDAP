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

- (void)finishProcessingObject:(id<ABMoneyFlow>)object {
    object.state = ABWorkerFree;
    self.state = ABWorkerFree;
}

@end
