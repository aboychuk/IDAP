//
//  ABCar.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCar.h"

static NSUInteger ABCarMoney = 100;

@interface ABCar ()
@property (nonatomic, assign)   NSUInteger  money;

@end

@implementation ABCar

- (instancetype)init {
    self = [super init];
    self.state = ABCarStateDirty;
    self.money = ABCarMoney;
    
    return self;
}

- (NSUInteger)giveMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

@end
