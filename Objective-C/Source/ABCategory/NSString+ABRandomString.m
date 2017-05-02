//
//  NSString+ABRandomString.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSString+ABRandomString.h"

@implementation NSString (ABRandomString)
+ (NSString *)randomStringWithLength:(NSUInteger) length {
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (NSUInteger index = 0; index < length; index++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
