//
//  NSNumber+ABRandomNumber.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSNumber+ABRandomNumber.h"

@implementation NSNumber (ABRandomNumber)

+ (NSUInteger)randomNumberBetweenMinMax:(NSUInteger)min max:(NSUInteger)max {
    return  (arc4random() % (max - min + 1)) + min;
}

@end
