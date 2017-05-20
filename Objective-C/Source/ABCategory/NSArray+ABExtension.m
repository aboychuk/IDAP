//
//  NSArray+ABExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/18/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSArray+ABExtension.h"

@implementation NSArray (ABExtension)

- (NSArray *)arrayWithObjectsOfClass:(Class)class {
    NSMutableArray *objectsOfClass = [NSMutableArray array];
    for (NSObject *object in self) {
        if ([object isKindOfClass:class]){
            [objectsOfClass addObject:object];
        }
    }
    
    return [NSArray arrayWithArray:objectsOfClass];
}

@end
