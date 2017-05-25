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
#pragma mark Private Methods

- (void)processObject:(ABCar *)car {
    [self specificClassOperation:car];
    [self takeMoneyFromObject:car];
}

- (void)specificClassOperation:(ABCar *)car {
    NSLog(@"Washer %@ start washing car", self.name);
    car.state = ABCarStateClean;
}


@end
