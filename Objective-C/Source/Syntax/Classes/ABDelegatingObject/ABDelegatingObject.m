//
//  ABDelegatingObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDelegatingObject.h"

@implementation ABDelegatingObject

#pragma mark
#pragma mark - Accesors

- (void)setState:(NSUInteger)state {
    BOOL shouldChange = YES;
    id<ABDelegatingObjectDelegate> delegate = self.delegate;
    
    if ([delegate respondsToSelector:@selector(delegatingObjectShouldChangeState:)]) {
        shouldChange = [delegate delegatingObjectShouldChangeState:self];
    }
    
    if (shouldChange) {
        _state = state;
        
        [delegate delegatingObject:self didChangeState:state];
    }
}

@end
