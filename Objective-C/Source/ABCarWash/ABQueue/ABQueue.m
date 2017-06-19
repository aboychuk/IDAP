//
//  ABQueue.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABQueue.h"

@interface ABQueue ()
@property (nonatomic, retain)   NSMutableArray  *mutableQueue;

@end

@implementation ABQueue

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableQueue = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark
#pragma mark - Accesors

- (BOOL)isEmpty {
    return self.count == 0;
}

- (NSUInteger)count {
    return [self.mutableQueue count];
}

#pragma mark
#pragma mark - Public Methods

- (void)addObjectToQueue:(id)object {
    if (object) {
        [self.mutableQueue addObject:object];
    }
}

- (id)popObjectFromQueue {
    id result = [self.mutableQueue firstObject];
    if (result) {
        [self.mutableQueue removeObjectAtIndex:0];
    }
    
    return [[result retain] autorelease];
}

@end
