//
//  ABWorker.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABWorker.h"

@implementation ABWorker

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    [self.name release];
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init{
    self = [super init];
    self.name = @"ALex";
    self.salary = 4000;
    self.experience = 5;
    
    return self;
}

- (void)takeMoney:(ABWorker *)worker {
    self.money += [worker giveMoney];
}

- (NSUInteger)giveMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

- (void)takeMoneyFromObject:(id<ABMoneyFlow>)object {
    self.money += [object giveMoney];
}

@end
