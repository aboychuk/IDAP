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

- (void)processScpecificOperations:(id<ABMoneyFlow>)object {
    [self calculateMoney];
}

- (void)calculateMoney {
    NSLog(@"Accountant got no tax from %lu.", self.money);
}

@end
