//
//  NSNumber+ABRandomNumber.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSNumber+ABRandomNumber.h"

@implementation NSNumber (ABRandomNumber)

BOOL ABRandomBool() {
    return arc4random_uniform(2);
}

NSUInteger ABRandomInRange(NSRange range) {
    return arc4random_uniform((uint32_t)range.length) + range.location;
}

@end
