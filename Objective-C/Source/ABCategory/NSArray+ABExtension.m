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

+ (NSArray *)objectsWithCount:(NSUInteger)count block:(id(^)())block {
    if (!block) {
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = block();
    }
    
    return [NSArray arrayWithArray:result];
}

- (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray objectsWithCount:count block: ^{ return [NSObject object]; }];
}

- (instancetype)objectsWithClass:(Class)cls {
    NSPredicate *predicate = [NSPredicate predicateWithBlock: ^BOOL(id obj, NSDictionary *bind) {
        return [obj isMemberOfClass:cls];
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}


@end
