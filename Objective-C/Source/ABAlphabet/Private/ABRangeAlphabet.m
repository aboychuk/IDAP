//
//  ABRangeAlphabet.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABRangeAlphabet.h"

@interface ABRangeAlphabet ()
@property (nonatomic, assign)   NSRange range;

@end

@implementation ABRangeAlphabet

#pragma mark
#pragma mark - Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    
    if (self) {
        self.range = range;
    }
    return self;
}

#pragma mark
#pragma mark - Public Methods

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    
    NSAssert(index < range.length, NSRangeException);
    
    return [NSString stringWithFormat:@"%c", (unichar)(range.location + index)];
}

@end
