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
    [super takeMoneyFromObject:car];
}

- (void)processObject:(ABCar *)car {
    [self washCar:car];
    [super takeMoneyFromObject:car];
}

- (void)washCar:(ABCar *)car {
    NSLog(@"Washer %@ start washing car", self.name);
    car.state = ABCarStateClean;
}

@end
