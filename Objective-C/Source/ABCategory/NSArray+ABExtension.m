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

+ (NSArray *)objectsWithCount:(NSUInteger)count factoryBlock:(id(^)())block {
    if (!block) {
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = block();
    }
    
    return [NSArray arrayWithArray:result];
}

- (instancetype)filteredObjectsWithClass:(Class)cls {
    NSPredicate *predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bind) {
        return [object isMemberOfClass:cls];
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}



@end
