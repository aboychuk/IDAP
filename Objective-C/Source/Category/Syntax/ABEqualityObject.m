//
//  ABEqualityObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/12/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABEqualityObject.h"

@interface ABEqualityObject ()
@property (nonatomic, assign)  NSUInteger  value;

@end

@implementation ABEqualityObject

#pragma mark
#pragma mark - Class Methods

+ (instancetype)objectWithValue:(NSUInteger)value {
    return [[[self alloc] initWithValue:value] autorelease];
}

#pragma mark
#pragma mark Initializations and Dealocations

- (instancetype)initWithValue:(NSUInteger)value {
    self = [super init];
    if (self) {
        self.value = value;
        
    }
    
    return self;
}

#pragma mark
#pragma mark Comparison

- (NSUInteger)hash {
    return self.value ^ [self.name hash] ^ [self.surname hash];
}

- (BOOL)isEqual:(ABEqualityObject *)object {
    if ([object isMemberOfClass:[self class]]) {
        return [self isEqualToEqualityObject:object];
    }
    
    return YES;
}

- (BOOL)isEqualToEqualityObject:(ABEqualityObject *)object {
    return self.value == object.value
    && [self.name isEqualToString:object.name]
    && [self.surname isEqualToString:object.surname];
}

#pragma mark
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    ABEqualityObject *result = [[[self class] alloc] initWithValue:self.value];
    result.name = self.name;
    result.surname = self.surname;
    
    return result;
}

@end
