//
//  ABAlphabet.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/24/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
NSRange ABAlphabetRange(unichar value1, unichar value2);

@interface ABAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithSymbols:(NSString *)string;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithStrings:(NSArray *)string;
- (instancetype)initWithSymbols:(NSString *)strings;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

@end
