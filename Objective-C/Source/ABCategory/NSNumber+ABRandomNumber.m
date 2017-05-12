//
//  NSNumber+ABRandomNumber.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSNumber+ABRandomNumber.h"

@implementation NSNumber (ABRandomNumber)

+ (NSUInteger)randomNumberBetweenMin:(NSUInteger)min max:(NSUInteger)max {
    return (arc4random_uniform(UINT32_MAX) % (max - min + 1)) + min;
}

@end
