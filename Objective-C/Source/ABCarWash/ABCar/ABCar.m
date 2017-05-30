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

#pragma mark -
#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    self.state = ABCarStateDirty;
    self.money = ABCarMoney;
    
    return self;
}

#pragma mark
#pragma mark Protocol Methods

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

- (void)takeMoneyFromObject:(id<ABMoneyFlow>)object {
    self.money += [object giveMoney];
    NSLog(@"%@ got %lu USD from the %@",
          NSStringFromClass([self class]),
          self.money,
          NSStringFromClass([object class]));
    
}

@end
