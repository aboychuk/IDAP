//
//  ABObjCSyntax.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 23.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

#import "ABObjCSyntax.h"
#import "ABSyntax.h"
#import "ABSyntax+ABCategory.h"
#import "ABSyntaxSubclass.h"
#import "ABEqualityObject.h"
#import "NSString+ABExtensions.h"

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

static
void ABObjCEqualityClass();

static
void ABObjCRandomString();

static
void ABObjCBlock();

#pragma mark
#pragma mark - Public Implementations

void ABObjCSyntax() {
    ABAutoreleasePoolLiteral();
    ABAutoreleasePoolExplicit();
    ABObjCNil();
    ABObjCLiterals();
    ABObjCTollFreeBridging();
    ABObjCMessaging();
    ABObjCEqualityClass();
    ABObjCRandomString();
    ABObjCBlock();
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

void ABObjCEqualityClass() {
    NSString *name = @"Ivan";
    NSString *surname = @"Ivanov";
    
    ABEqualityObject *object = [ABEqualityObject objectWithValue:1];
    object.name = name;
    object.surname = surname;
    
    ABEqualityObject *reverseObject = [ABEqualityObject objectWithValue:1];
    reverseObject.surname = surname;
    reverseObject.name = name;
    /*
     NSUInteger hash = [object hash];
     NSUInteger reverseHash = [reverseObject hash];
     
     NSArray *array = @[object, [[object copy] autorelease], reverseObject];
     
     BOOL containsObject = [array containsObject:reverseObject];
     */
}

void ABObjCRandomString() {
    NSLog(@"%@", [NSString randomString]);
    NSLog(@"%@", [NSString randomStringWithLength:3]);
    NSLog(@"%@", [NSString randomStringWithLength:3 alphabet:[NSString numericAlphabet]]);
    
    SEL selectors[] = { @selector(alphanumericAlphabet),
        @selector(numericAlphabet),
        @selector(lowercaseLetterAlphabet),
        @selector(capitalizedLetterAlphabet),
        @selector(letterAlphabet)};
    
    NSUInteger count = sizeof(selectors) / sizeof(selectors);
    id class = [NSString class];
    
    for (NSUInteger index = 0; index < count; index++) {
        NSLog(@"%@", [class performSelector:selectors[index]]);
    }
}

typedef void(^ABPrintBlock)(NSString *string);
typedef NSString *(^ABStringBlock)(void);

void ABObjCBlock() {
    ABPrintBlock printBlock = ^(NSString *string) {
        NSLog(@"Called from block = %@", string);
    };
    
    ABStringBlock stringBlock = ^() {
        return @"string from stringBlock";
    };
    
    printBlock(@"MAMA!");
    printBlock(@"PAPA!");
    printBlock(stringBlock());
    
//    printBlock = nil;
    
//    printBlock(stringBlock());
    
    __block NSUInteger value = 0;
    __block NSArray *array = [[NSArray alloc] initWithObjects:[[NSObject new] autorelease], nil];
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    void(^blockHolder)() = ^() {
        value++;
        [mutableArray addObject:[[NSObject new] autorelease]];
        NSLog(@"block holder value = %lu", value);
        NSLog(@"array = %@", array);
        NSLog(@"mutableArray = %@", mutableArray);
        NSLog(@"block holder");
        printBlock(stringBlock());
    };
    
    blockHolder = [[blockHolder copy] autorelease];
    
    stringBlock = nil;
    printBlock = nil;
    
    blockHolder();
    blockHolder();
    
    [array release];
    array = nil;
    
    blockHolder();

}



