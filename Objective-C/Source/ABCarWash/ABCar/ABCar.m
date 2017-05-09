//
//  ABCar.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCar.h"

static NSUInteger ABCarMoney = 100;

@implementation ABCar

- (instancetype)init {
    self = [super init];
    self.cleaness = dirty;
    self.money = ABCarMoney;
    
    return self;
}

- (NSUInteger)payForWash {
    NSUInteger moneyFromCar = self.money;
    NSLog(@"Car payed for wash %lu USD.", self.money);
    self.money = 0;
    return moneyFromCar;
}

@end
