//
//  ABDirector.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDirector.h"

@implementation ABDirector

#pragma mark
#pragma mark Initialization

- (instancetype)init {
    self = [super init];
    self.profit = 0;
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)takeMoneyFromAccountant:(NSUInteger)moneyFromAccountant {
    self.profit = moneyFromAccountant;
    NSLog(@"Director got money from Accountant");
}

@end
