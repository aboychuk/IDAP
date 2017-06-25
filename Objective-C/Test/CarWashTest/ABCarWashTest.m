//
//  ABCarWashTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashTest.h"

#import "NSObject+ABObjectExtension.h"
#import "NSArray+ABExtension.h"

static NSUInteger   countOfCars = 1000;

@implementation ABCarWashTest

+ (void)startTest {
    NSArray *cars = [NSArray objectsWithCount:countOfCars factoryBlock:^id{
        return [[ABCar new] autorelease];
    }];

    ABCarWash *carWashCompany = [ABCarWash object];
    [carWashCompany washCars:cars];
    
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
    [runLoop run];

}

@end
