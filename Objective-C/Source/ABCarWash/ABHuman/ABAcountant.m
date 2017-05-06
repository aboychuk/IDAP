//
//  ABAcountant.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAcountant.h"

@implementation ABAcountant

#pragma mark
#pragma mark Initialization

- (instancetype)init {
    [super init];
    self.moneyForCount = 0;
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)takeMoneyFromWasher:(NSUInteger)moneyFromWasher {
    self.moneyForCount = moneyFromWasher;
    NSLog(@"Accountant got money from washer");
}

- (NSUInteger)giveMoneyToDirector {
    NSUInteger profitMoney = self.moneyForCount;
    self.moneyForCount = 0;
    
    return profitMoney;
}

@end
