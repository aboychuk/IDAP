//
//  ABObjCSyntax.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 23.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

#pragma mark
#pragma mark - Private Declarations

static
void ABAutoreleasePoolLiteral();

static
void ABAutoreleasePoolExplicit();

static
void ABObjCNil();

static
void ABObjCLiterals();

static
void ABObjCTollFreeBridging();

static
void ABObjCMessaging();

#pragma mark
#pragma mark - Public Implementations

void ABObjCSyntax() {
    ABAutoreleasePoolLiteral();
    ABAutoreleasePoolExplicit();
    ABObjCNil();
    ABObjCLiterals();
    ABObjCTollFreeBridging();
    ABObjCMessaging();

}

#pragma mark
#pragma mark - Private Declarations

void ABAutoreleasePoolLiteral() {
    @autoreleasepool {
        id object = [[NSObject new] autorelease];

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

void ABObjCNil() {
    NSLog(@"nil and Nil");

    id object = nil;
    Class class = Nil;
    
    NSLog(@"object = %@ class = %@", object, class);
}

void ABObjCLiterals() {
    NSNumber *number = @(3);
    NSLog(@"number literal = %@ number class = %@", number, [number class]);
    
    NSArray *array = @[number, number];
    NSLog(@"array literal = %@ array class = %@", array, [array class]);
    
    NSString *string = @"string";
    NSLog(@"string literal = %@ string class = %@", string, [string class]);
    
    NSDictionary *dictionary = @{number : string};
    NSLog(@"dictionary literal = %@ dictionary class = %@", dictionary, [dictionary class]);
    
}

void ABObjCTollFreeBridging() {
    CFStringRef stringRef = (CFStringRef)[[NSString alloc] initWithFormat:@"%d", arc4random()];
    NSString *string = (NSString *) stringRef;
    [string retain];
    
    NSLog(@"string retain count = %lu", (unsigned long)[string retainCount]);
    NSLog(@"CFString = %@ NSString = %@", (NSString *)stringRef, [string description]);
    
    CFRelease(stringRef);
    
    NSLog(@"string retain count = %lu", (unsigned long)[string retainCount]);
    [string release];

}

void ABObjCMessaging() {
    NSLog(@"Messaging");
    
    id object = [[NSObject new] autorelease];
    NSLog(@"NSObject = %@", object);
    
    object = [NSMutableArray arrayWithObjects:object, [[NSObject new] autorelease], nil];
    NSLog(@"NSMutableArray = %@", object);

    object = [NSMutableDictionary dictionary];
    [object setObject:[[NSObject new] autorelease]
               forKey:[[[NSString alloc] initWithFormat:@"%d", arc4random()] autorelease]];
    NSLog(@"NSMutableDictionary = %@", object);
    
    SEL selector = @selector(setObject:forKey:);
    [object performSelector:selector
                 withObject:[[NSObject new] autorelease]
                 withObject:[[[NSString alloc] initWithFormat:@"%d", arc4random()] autorelease]];
    NSLog(@"NSMutableDictionary = %@", object);
    
    ((void(*)(id, SEL, id, id)) objc_msgSend)(object,
                                             selector,
                                             [[NSObject new] autorelease],
                                             [[[NSString alloc] initWithFormat:@"%d", arc4random()] autorelease]);
    NSLog(@"NSMutableDictionary = %@", object);
    
    id result = ((id(*)(id, SEL, id))objc_msgSend)(object,
                                                   @selector(objectForKey:),
                                                   [[object allKeys] lastObject]);
    NSLog(@"NSMutableDictionary result = %@", result);

}
