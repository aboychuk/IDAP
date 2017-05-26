//
//  ABAlphabet.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/24/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithStrings:(NSString *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithSymbols:(NSString *)strings;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithStrings:(NSString *)strings;
- (instancetype)initWithSymbols:(NSString *)strings;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

@end
