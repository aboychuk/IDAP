//
//  ABDelegatingObjectSpec.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "Kiwi.h"

#import "ABDelegate.h"
#import "ABDelegatingObject.h"

SPEC_BEGIN(ABDelegatingObjectSpec)

describe(@"ABDelegatingObject", ^{
    __block ABDelegatingObject *delegatingObject = nil;
    beforeAll(^{
        delegatingObject = [ABDelegatingObject new];
    });
    
    context(@"when setting state to 1 with delegate set", ^{
        __block ABDelegate *delegate = nil;
        
        beforeAll(^{
            delegate = [ABDelegate mock];
            [delegate stub:@selector(delegatingObject:didChangeState:)];
            [delegate stub:@selector(delegatingObjectShouldChangeState:) andReturn:theValue(YES)];
            
            delegatingObject.delegate = delegate;
        });
        
        it(@"should receive '-delegatingObject:didChangeState:'", ^{
            [[delegate should] receive:@selector(delegatingObject:didChangeState:)];
            
            delegatingObject.state = 1;
        });
    });
});

SPEC_END
