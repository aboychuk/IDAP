//
//  ABClasterAlphabet.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABClasterAlphabet.h"

@interface ABClasterAlphabet ()
@property (nonatomic, retain)   NSArray     *alphabets;
@property (nonatomic, assign)   NSUInteger  count;

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets;

@end

@implementation ABClasterAlphabet

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
        self.count = [self countWithAlphabets:alphabets];
    }
    
    return self;
}

#pragma mark
#pragma mark - Public Methods

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSUInteger iteratedIndex = index;
    
    NSAssert(index < count, NSRangeException);
    
    NSUInteger iterator = 0;
    for (ABAlphabet *alphabet in self.alphabets) {
        if (iterator >= index) {
            return alphabet[iteratedIndex];
        }
        
        count = [alphabet count];
        iterator += count;
        iteratedIndex -= count;
    }
    
    return nil;
}

#pragma mark
#pragma mark - Public Methods

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets {
    NSUInteger count = 0;
    
    for (ABAlphabet *alphabet in alphabets) {
        count += [alphabet count];
    }
    
    return count;
}

#pragma mark
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])stackbuf
                                    count:(NSUInteger)resultLength
{
    return [self.alphabets countByEnumeratingWithState:state
                                             objects:stackbuf
                                               count:resultLength];
}


@end
