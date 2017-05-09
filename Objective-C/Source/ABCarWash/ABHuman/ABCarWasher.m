//
//  ABCarWasher.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWasher.h"

@implementation ABCarWasher

#pragma mark
#pragma mark Initialization

- (instancetype)init {
    self = [super init];
    self.paymentForWash = 0;
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)washCar:(ABCar *)car {
    car.cleaness = clean;
    NSLog(@"Car is clean.");
}

- (void)takeMoneyFromCar:(NSUInteger)moneyFromCar {
    self.paymentForWash = moneyFromCar;
    NSLog(@"Washer got money from car");
}

- (NSUInteger)giveMoneyToAccountant {
    NSUInteger moneyForCount = self.paymentForWash;
    self.paymentForWash = 0;
    
    return moneyForCount;
}

@end
