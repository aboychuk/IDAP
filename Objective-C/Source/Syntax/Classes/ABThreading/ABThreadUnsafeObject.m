//
//  ABThreadUnsafeObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/13/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABThreadUnsafeObject.h"

@implementation ABThreadUnsafeObject

#pragma mark
#pragma mark Accessors

- (void)setValue:(id)value {
    @synchronized (self) {
        if (value != _value) {
            NSLog(@"=================================================");
            [_value release];
            _value = [value retain];
            
            NSLog(@"sleep");
            usleep(1000 * 10);
            NSLog(@"wakeup");
            
            NSAssert(_value == value, @"");
            NSLog(@"assigned value = %@", value);
        }
    }
}

@end
