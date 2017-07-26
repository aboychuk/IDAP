//
//  ABSyntax.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 24.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSyntax.h"

@interface ABSyntax() // extension
@property(nonatomic, assign) NSUInteger  integerValue;

- (void)sayHiFromExtension;

@end

@implementation ABSyntax

@synthesize object = _publicObject;
@synthesize atomicCopyObject = _atomicCopyObject;
@synthesize ready = _ready;

@dynamic array;

#pragma mark
#pragma mark Class Methods

+ (instancetype)syntax {
    return [[[self alloc] init] autorelease];
}
#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.object = nil;
    [self setObject:nil];
    
    self.atomicCopyObject = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.integerValue = 1;
    }
    return self;
}

#pragma mark
#pragma mark Accesors Methods
/*
- (void)setObject:(id<ABSyntaxProtocol>)object {
    if (_publicObject != object) {
        [_publicObject release];
        
        _publicObject = [object retain];
    }
}

- (id<ABSyntaxProtocol>) object {
    return [[_publicObject retain] autorelease];
}
*/
- (void)setAtomicCopyObject:(NSObject *)atomicCopyObject {
    @synchronized (self) {
        if (_atomicCopyObject != atomicCopyObject) {
            [_atomicCopyObject release];
            
            _atomicCopyObject = [atomicCopyObject copy];
        }
    }
}

- (NSObject *)atomicCopyObject {
    @synchronized (self) {
            return [[_atomicCopyObject retain] autorelease];
    }
}

- (void)setIsReady:(BOOL)ready {
    ready = _ready;
}

- (BOOL)isReady {
    return _ready;
}

- (NSArray *) array {
    return [[[[[NSMutableArray alloc] initWithObjects:[[NSObject new] autorelease], nil] autorelease] copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)sayHi {
    [self sayWithString:@"HI!"];
}

- (NSString *)text {
    return NSStringFromClass([self class]);
}

- (void)sayWithString:(NSString *)string {
    [self sayWithString:string name:[self description]];
}

- (void)sayWithString:(NSString *)string name:(NSString *)name {
        NSLog(@"%@ %@", string, name);
}

- (NSUInteger)integerValue {
    return _integerValue;
}
#pragma mark
#pragma mark Private Methods

- (void)sayHiFromExtension {
    
}

- (void)overloadedPrint {
    NSLog(@"%@ %s line = %d", self, __FILE__, __LINE__);
}

- (void)print {
    NSLog(@"%@ %s line = %d", self, __FILE__, __LINE__);
}

@end

