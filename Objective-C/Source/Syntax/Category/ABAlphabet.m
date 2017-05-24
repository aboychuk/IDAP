//
//  ABAlphabet.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/24/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAlphabet.h"

#import <math.h>

#import "ABClasterAlphabet.h"
#import "ABRangeAlphabet.h"
#import "ABStringsAlphabet.h"

#import "NSString+ABExtensions.h"

NSRange ABAlphabetRange(unichar value1, unichar value2) {
    unichar minValue = MIN(value1, value2);
    unichar maxValue = MAX(value1, value2);
    
    return NSMakeRange(minValue, maxValue - minValue + 1);
}

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

- (instancetype)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
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
