//
//  NSObject+ABObjectExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/16/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSObject+ABObjectExtension.h"
#import "NSArray+ABExtension.h"

@implementation NSObject (ABObjectExtension)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray objectsWithCount:count factoryBlock: ^{ return [self object]; }];
}

@end
