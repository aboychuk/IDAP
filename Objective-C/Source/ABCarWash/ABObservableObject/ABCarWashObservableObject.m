//
//  ABCarWashObservableObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashObservableObject.h"

@interface ABCarWashObservableObject ()
@property (nonatomic, assign)    NSHashTable     *observersHashTable;

@end

@implementation ABCarWashObservableObject

@dynamic observersSet;

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.observersHashTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark
#pragma mark - Accesors

- (NSSet *)obsrversSet {
    @synchronized (self) {
        NSHashTable *observersHashTable = self.observersHashTable;
        return [[observersHashTable copy] autorelease];
    }
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            [self notifyOfChangeState:state];
        }
    }
}

#pragma mark
#pragma mark - Public Methods

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.observersHashTable removeObject:observer];
    }
}

- (BOOL)isObservedByObject:(id)observer {
    @synchronized (self) {
        return [self.observersHashTable containsObject:observer];
    }
}

#pragma mark
#pragma mark - Private Methods

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    @synchronized (self) {
        NSHashTable *observersHashTable = self.observersHashTable;
        for (id observer in observersHashTable) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self];
            }
        }
    }
}

- (void)notifyOfChangeState:(NSUInteger)state {
    [self notifyOfStateChangeWithSelector:[self selectorForState:state]];
}

@end
