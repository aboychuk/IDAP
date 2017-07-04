//
//  ABCarWashTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashTest.h"

#import "NSObject+ABObjectExtension.h"

//static NSUInteger   countOfCars = 250;

@implementation ABCarWashTest

+ (void)startTest {
    ABCarWashController *carWashController = [ABCarWashController object];
    
    carWashController.running = YES;
    
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
    [runLoop run];

}

@end
