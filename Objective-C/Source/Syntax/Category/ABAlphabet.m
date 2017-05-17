//
//  ABAlphabet.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAlphabet.h"

#import "ABClasterAlphabet.h"
#import "ABRangeAlphabet.h"
#import "ABStringsAlphabet.h"

#import "NSString+ABExtensions.h"

@implementation ABAlphabet

#pragma mark
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[ABRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[ABStringsAlphabet alloc] initWithStrings:strings] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[ABClasterAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}

+ (instancetype)alphabetWithSymbols:(NSString *)string {
    return [self alphabetWithStrings:[string symbols]];
}

#pragma mark
#pragma mark Initializations and Deallocations

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[ABClasterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[ABRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[ABStringsAlphabet alloc] initWithStrings:strings];
}

- (instancetype)initWithSymbols:(NSString *)strings {
    return [self initWithStrings:[strings symbols]];
}

#pragma mark
#pragma mark Public Methods

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

#pragma mark
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id  _Nullable *)buffer
                                    count:(NSUInteger)len {
    return 0;
}

@end