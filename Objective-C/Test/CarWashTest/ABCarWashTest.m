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

//static NSUInteger   countOfCars = 250;

@implementation ABCarWashTest

+ (void)startTest {
    ABCarWash *carWashCompany = [ABCarWash object];
    
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
    [runLoop run];

}

@end
