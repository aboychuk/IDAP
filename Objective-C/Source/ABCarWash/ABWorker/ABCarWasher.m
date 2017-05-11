//
//  ABCarWasher.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWasher.h"

@implementation ABCarWasher

- (void)takeMoneyFromObject:(ABCar *)car {
    NSLog(@"Washing car");
    car.ABCarState = ABCarStateClean;
    
    [super takeMoneyFromObject:car];
    NSLog(@"Car payed %lu", self.money);
}

@end
