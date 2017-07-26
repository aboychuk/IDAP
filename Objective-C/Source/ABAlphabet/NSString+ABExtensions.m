//
//  NSString+ABExtensions.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/12/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSString+ABExtensions.h"

static const NSUInteger ABNSStringDefaultRandomStringLength = 30;

@implementation NSString (ABExtensions)

+ (instancetype)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self letterAlphabet]];
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('0',
                                                      '9' - '0' + 1)];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('a',
                                                      'z' - 'a' + 1)];
}

+ (instancetype)capitalizedLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('A',
                                                      'Z' - 'A' + 1)];
}

+ (instancetype)letterAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self lowercaseLetterAlphabet]];
    [result appendString:[self capitalizedLetterAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(ABNSStringDefaultRandomStringLength)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar resultChar = [alphabet characterAtIndex:arc4random_uniform((uint32_t)alphabetLength)];
        [result appendFormat:@"%c", resultChar];
    }
    
    return [self stringWithString:result];
}

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self length]];
    NSUInteger length = [self length];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar resultChar = [self characterAtIndex:index];
        [result addObject:[NSString stringWithFormat:@"%c", resultChar]];
    }
    
    return [[result copy] autorelease];
}

@end
