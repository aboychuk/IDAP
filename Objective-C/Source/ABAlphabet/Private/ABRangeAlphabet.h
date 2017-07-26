//
//  ABRangeAlphabet.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAlphabet.h"

@interface ABRangeAlphabet : ABAlphabet
@property (nonatomic, readonly) NSRange range;

- (instancetype)initWithRange:(NSRange)range;

@end
