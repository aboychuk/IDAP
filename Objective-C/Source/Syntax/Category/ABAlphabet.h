//
//  ABAlphabet.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithSymbols:(NSString *)string;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithSymbols:(NSString *)strings;

- (NSUInteger)count;
- (NSString *)objectAtIndex:(NSUInteger)index;
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

@end
