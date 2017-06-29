//
//  ABDispatcher.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/25/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDispatcher.h"

#import "ABQueue.h"

@interface ABDispatcher ()
@property (nonatomic, retain)   ABQueue         *processedObjects;
@property (nonatomic, retain)   ABQueue         *handlers;
@property (nonatomic, retain)   NSMutableArray  *mutableHandlers;

@end

@implementation ABDispatcher

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.processedObjects = nil;
    self.handlers = nil;
    self.mutableHandlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.processedObjects = [ABQueue object];
        self.handlers = [ABQueue object];
        self.mutableHandlers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)addHandler:(id)handler {
    @synchronized (self) {
        NSMutableArray *handlers = self.mutableHandlers;
        if (![handlers containsObject:handler]) {
            [handlers addObject:handler];
            [handler addObserver:self];
            
            [self.handlers addObjectToQueue:handler];
        }
    }
}

- (void)addHandlers:(NSArray *)handlers {
    for (id handler in handlers) {
        [self addHandler:handler];
    }
}

- (void)removeHandler:(id)handler {
    @synchronized (self) {
        [handler removeObserver:self];
        [self.mutableHandlers removeObject:handler];
        [self.handlers removeObject:handler];

    }
}

- (void)takeObjectForProcessing:(id<ABMoneyFlow>)object {
    [self.processedObjects addObjectToQueue:object];
    [self startWork];
    }

- (void)startWork {
    id handler = [self.handlers popObjectFromQueue];
    if (handler) {
        id object = [self.processedObjects popObjectFromQueue];
        if (object) {
            [handler processObject:object];
        }
    }
}
    
#pragma mark
#pragma mark ABWorkerObserver Methods

- (void)workerDidBecomeReadyForProcess:(id<ABMoneyFlow>)object {
    NSMutableArray *handlers = self.mutableHandlers;
    if (![handlers containsObject:object]) {
        [self takeObjectForProcessing:object];
    }
}

- (void)workerDidBecomeFree:(id<ABMoneyFlow>)object {
    NSMutableArray *handlers = self.mutableHandlers;
    if ([handlers containsObject:object]) {
        [self.handlers addObjectToQueue:object];
        [self takeObjectForProcessing:object];
    }
}

@end
