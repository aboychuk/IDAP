//
//  ABCarWasher.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWasher.h"

@interface ABCarWasher ()

- (void)wash:(ABCar *)car;

@end

@implementation ABCarWasher

#pragma mark
#pragma mark Private Methods

- (void)processScpecificOperations:(ABCar *)car {
    [self wash:car];
}
- (void)wash:(ABCar *)car {
    NSLog(@"Washer %@ start washing car", self.name);
    car.state = ABCarStateClean;
}

@end
