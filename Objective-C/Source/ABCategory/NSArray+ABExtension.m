//
//  NSArray+ABExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/18/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSArray+ABExtension.h"
#import "NSObject+ABObjectExtension.h"


@implementation NSArray (ABExtension)

#pragma mark
#pragma mark - Class Methods

+ (NSArray *)objectsWithCount:(NSUInteger)count factoryBlock:(ABFactoryBlock)factoryBlock {
    if (!factoryBlock) {
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = factoryBlock();
    }
    
    return [NSArray arrayWithArray:result];
}

#pragma mark
#pragma mark - Object Methods

- (instancetype)filteredObjectsWithClass:(Class)cls {
    NSPredicate *predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bind) {
        return [object isMemberOfClass:cls];
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

- (instancetype)objectsWithClass:(Class)cls {
    NSPredicate *predicate = [NSPredicate predicateWithBlock: ^BOOL(id obj, NSDictionary *bindings) {
        return [obj isKindOfClass:cls];
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

- (instancetype)filteredArrayWithBlock:(ABBoolBlock)boolBlock {
    if (!boolBlock) {
        return nil;
    }
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
        return boolBlock(object);
    }];
    return [self filteredArrayUsingPredicate:predicate];
}


@end
