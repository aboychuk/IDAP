//
//  ABObservableObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

#import "ABAssignReference.h"

typedef void(^ABNotificationBlock)(id observer);

@interface ABObservableObject ()
@property (nonatomic, retain)   NSMutableSet    *mutableObserversSet;

- (void)notifyOfStateChangeWithSelector:(SEL)selector;
- (void)notifyOfStateChangeWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyOfStateChangeWithSelector:(SEL)selector notificationHandler:(ABNotificationBlock)handler;

@end

@implementation ABObservableObject

@dynamic obsrversSet;

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableObserversSet = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObserversSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark
#pragma mark - Accesors

- (NSSet *)obsrversSet {
    NSMutableSet *observersSet = self.mutableObserversSet;
    NSMutableSet *result = [NSMutableSet setWithCapacity:[observersSet count]];
    for (ABAssignReference *reference in  observersSet) {
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

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (state != _state) {
        _state = state;
        
        [self notifyOfStateChangeWithSelector:[self selectorForState:state]];
    }
}

#pragma mark
#pragma mark - Private Methods

- (void)addObserver:(id)observer {
    [self.mutableObserversSet addObject:[ABAssignReference referanceWithTarget:observer]];
}

- (void)removeObserver:(id)observer {
    [self.mutableObserversSet removeObject:[ABAssignReference referanceWithTarget:observer]];
}

- (BOOL)isObservedByObject:(id)observer {
    return [self.mutableObserversSet containsObject:[ABAssignReference referanceWithTarget:observer]];
}

#pragma mark
#pragma mark - Private Methods

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector
                    notificationHandler:(ABNotificationBlock)handler {
    if (!handler) {
        return;
    }
    
    NSMutableSet *observersSet = self.mutableObserversSet;
    for (ABAssignReference *reference in observersSet) {
        id target = reference.target;
        if ([reference respondsToSelector:selector]) {
            handler(target);
        }
    }
}


- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    [self notifyOfStateChangeWithSelector:selector
                      notificationHandler:^(id observer) {
                          [observer performSelector:selector
                                         withObject:self];
                      }];
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector withObject:(id)object {
    [self notifyOfStateChangeWithSelector:selector
                      notificationHandler:^(id observer) {
                          [observer performSelector:selector
                                         withObject:self
                                         withObject:object];
                      }];
}

@end
