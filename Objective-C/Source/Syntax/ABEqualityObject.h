//
//  ABEqualityObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/12/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABEqualityObject : NSObject <NSCopying>
@property(nonatomic, readonly)  NSUInteger  value;
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, copy)     NSString    *surname;

+ (instancetype)objectWithValue:(NSUInteger)value;

- (instancetype)initWithValue:(NSUInteger)value;

- (BOOL)isEqualToEqualityObject:(ABEqualityObject *)object;

@end
