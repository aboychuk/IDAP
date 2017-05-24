//
//  ABAlphabetSpec.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/24/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "Kiwi.h"

#import "ABAlphabet.h"
#import "ABClasterAlphabet.h"
#import "ABRangeAlphabet.h"
#import "ABStringsAlphabet.h"

SPEC_BEGIN(ABAlphabetSpec)

describe(@"ABAlphabet", ^{
    __block ABAlphabet *alphabet = nil;
    
//    + (instancetype)alphabetWithRange:(NSRange)range;
//    + (instancetype)alphabetWithStrings:(NSString *)strings;
//    + (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
//    + (instancetype)alphabetWithSymbols:(NSString *)strings;
//    
//    - (instancetype)initWithAlphabets:(NSArray *)alphabets;
//    - (instancetype)initWithRange:(NSRange)range;
//    - (instancetype)initWithStrings:(NSString *)strings;
//    - (instancetype)initWithSymbols:(NSString *)strings;
//    
//    - (NSUInteger)count;
//    - (NSString *)stringAtIndex:(NSUInteger)index;
//    - (NSString *)objectAtIndexedSubscript:(NSUInteger)index;
    
    context(@"when initialized with + (instancetype)alphabetWithRange:(NSRange)range;", ^{
        let(variable, ^{ // Occurs before each enclosed "it"
            return [MyClass instance];
        });
        
        beforeAll(^{ // Occurs once
        });
        
        afterAll(^{ // Occurs once
        });
        
        beforeEach(^{ // Occurs before each enclosed "it"
        });
        
        afterEach(^{ // Occurs after each enclosed "it"
        });
        
        it(@"should do something", ^{
            [[variable should] meetSomeExpectation];
        });
        
        specify(^{
            [[variable shouldNot] beNil];
        });
        
        context(@"inner context", ^{
            it(@"does another thing", ^{
            });
            
            pending(@"something unimplemented", ^{
            });
        });
    });
});

SPEC_END
