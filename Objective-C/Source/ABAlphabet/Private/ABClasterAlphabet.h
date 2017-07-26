//
//  ABClasterAlphabet.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAlphabet.h"

@interface ABClasterAlphabet : ABAlphabet
@property (nonatomic, readonly)   NSArray *alphabets;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;

@end
