//
//  ABDelegate.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDelegate.h"

@implementation ABDelegate

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.delegatingObject = nil;
    
    [super dealloc];
}

#pragma mark
#pragma mark - Accesors

- (void)setDelegatingObject:(ABDelegatingObject *)delegatingObject {
    if (_delegatingObject != delegatingObject) {
        _delegatingObject.delegate = nil;
        [_delegatingObject release];
        _delegatingObject = [delegatingObject retain];
        
        _delegatingObject.delegate = self;
    }
}

#pragma mark
#pragma mark - Protocol Methods

- (void)delegatingObject:(ABDelegatingObject *)object didChangeState:(NSUInteger)state {
    
}

- (BOOL)delegatingObjectShouldChangeState:(ABDelegatingObject *)object {
    return YES;
}

@end
