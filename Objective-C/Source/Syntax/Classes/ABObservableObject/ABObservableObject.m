//
//  ABObservableObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

#import "ABAssignReference.h"

@interface ABObservableObject ()
@property (nonatomic, retain)   NSMutableSet    *mutableObserverSet;

@end

@implementation ABObservableObject

@dynamic obsrverSet;

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableObserverSet = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObserverSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark
#pragma mark - Accesors

- (NSSet *)obsrverSet {
    NSMutableSet *observerSet = self.mutableObserverSet;
    NSMutableSet *result = [NSMutableSet setWithCapacity:[observerSet count]];
    for (ABAssignReference *reference in  observerSet) {
        [result addObject:reference.target];
    }
    
    return [[result copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    if (state != _state) {
        _state = state;
        
        [self notifyOfStateChangeWithSelector:[self selectorForState:state]];
    }
}

#pragma mark
#pragma mark - Public Methods

- (void)addObserver:(id)observer {
    [self.mutableObserverSet addObject:[ABAssignReference referanceWithTarget:observer]];
}

- (void)removeObserver:(id)observer {
    [self.mutableObserverSet removeObject:[ABAssignReference referanceWithTarget:observer]];
}

- (BOOL)isObservedByObject:(id)observer {
    return [self.mutableObserverSet containsObject:[ABAssignReference referanceWithTarget:observer]];
}

#pragma mark
#pragma mark - Private Methods

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    NSMutableSet *observerSet = self.mutableObserverSet;
    for (ABAssignReference *reference in observerSet) {
        if ([reference.target respondsToSelector:selector]) {
            [reference.target performSelector:selector withObject:self];
        }
    }
}

@end
