//
//  NSObject+ABCreatureCategory.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 26.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSObject+ABCreatureCategory.h"

@implementation NSObject (ABCreatureCategory)

+ (id)objectCreate {
    return [[[self alloc] init] autorelease];
}

@end
