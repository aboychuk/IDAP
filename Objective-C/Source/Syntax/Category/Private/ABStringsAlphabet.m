//
//  ABStringsAlphabet.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABStringsAlphabet.h"

@interface ABStringsAlphabet ()
@property (nonatomic, retain)   NSArray *strings;

@end

@implementation ABStringsAlphabet

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.strings = nil;
    
    [super dealloc];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    self = [super init];
    if (self) {
        self.strings = strings;
    }
    
    return self;
}

#pragma mark
#pragma mark - Public Methods

- (NSUInteger)count {
    return [self.strings count];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return self.strings[index];
}

#pragma mark
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])stackbuf
                                    count:(NSUInteger)resultLength
{
    return [self.strings countByEnumeratingWithState:state
                                             objects:stackbuf
                                               count:resultLength];
}

@end
