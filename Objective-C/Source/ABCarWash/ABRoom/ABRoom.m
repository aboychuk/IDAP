//
//  ABRoom.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABRoom.h"

@interface ABRoom ()
@property (nonatomic, retain)   NSMutableArray  *mutableWorkers;

@end

@implementation ABRoom

@dynamic workers;

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableWorkers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableWorkers = [NSMutableArray array];
    }
    return self;
}
#pragma mark
#pragma mark Accesors

- (NSArray *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)addWorker:(ABWorker *)worker {
    if (worker) {
        [self.mutableWorkers addObject:worker];
    }
}

- (void)removeWorker:(ABWorker *)worker {
    [self.mutableWorkers removeObject:worker];
}

@end
