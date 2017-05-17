//
//  NSObject+ABObjectExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/16/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSObject+ABObjectExtension.h"

@implementation NSObject (ABObjectExtension)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (instancetype)arrayOfObjects:(id)object count:(NSUInteger)count {
    NSMutableArray *arrayOfObjects = [NSMutableArray array];
    for (NSUInteger index = 0; index < count; index++) {
        object = [[object new] autorelease];
        [arrayOfObjects addObject:object];
    }
    
    return [NSArray arrayWithArray:arrayOfObjects];
}
@end
