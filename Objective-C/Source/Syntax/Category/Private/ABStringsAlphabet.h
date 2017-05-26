//
//  ABStringsAlphabet.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAlphabet.h"

@interface ABStringsAlphabet : ABAlphabet
@property (nonatomic, readonly)   NSArray *strings;

- (instancetype)initWithStrings:(NSArray *)strings;

@end
