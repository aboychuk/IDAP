//
//  ABCarWashTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashTest.h"

#import "NSObject+ABObjectExtension.h"


@implementation ABCarWashTest

+ (void)startTest {
    NSMutableArray *cars = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < 9; i++) {
        ABCar *car = [[ABCar new] autorelease];
        [cars addObject:car];
    }

    ABCarWash *carWashCompany = [[[ABCarWash alloc] init] autorelease];
    
    for (ABCar *car in cars) {
        [carWashCompany startWashing:car];
    }
}

@end
