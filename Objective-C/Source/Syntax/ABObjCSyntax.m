//
//  ABObjCSyntax.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 23.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark
#pragma mark - Private Declarations

static
void ABAutoreleasePoolLiteral();
void ABAutoreleasePoolExplicit();


#pragma mark
#pragma mark - Public Implementations

void ABObjCSyntax() {
    ABAutoreleasePoolLiteral();
}

#pragma mark
#pragma mark - Private Declarations

void ABAutoreleasePoolLiteral() {
    @autoreleasepool {
        NSObject *object = [[[NSObject alloc] init] autorelease];

        NSLog(@"NSAutoreleasePool Literal");
        NSLog(@"object = %@", object);
    }
}

void ABAutoreleasePoolExplicit() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSObject *object = [[[NSObject alloc] init] autorelease];
    
    NSLog(@"NSAutoreleasepool Explicit");
    NSLog(@"object = %@", object);
    
    [pool drain];
}
