//
//  ABObservationController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservationController.h"

#import "ABObservationController+ABPrivate.h"

static NSString *kABObservationControllerAllocationException = @"ABObservationController should never be instantiated directly.";

@interface ABObservableObject ()
@property (nonatomic, assign) id                  observer;
@property (nonatomic, assign) ABObservableObject  *observableObject;

@end

@implementation ABObservationController

#pragma mark -
#pragma mark Class Methods

+ (instancetype)observationControllerWithObserver:(id)observer
                            observableObject:(ABObservableObject *)observableObject
{
    return [[[self alloc] initWithObserver:observer
                             observableObject:observableObject] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)initWithObserver:(id)observer
                observableObject:(ABObservableObject *)observableObject
{
    self = [self init];
    if (self) {
        self.observer = observer;
        self.observableObject = observableObject;
    }
    
    return self;
}

- (instancetype)init {
    NSAssert([self class] != [ABObservationController class], kABObservationControllerAllocationException);
    
    self = [super init];
    
    return self;
    
}
#pragma mark -
#pragma mark Private Methods

- (void)notifyWithState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)notifyWithState:(NSUInteger)state withObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (BOOL)isEqualToObservationState:(ABObservationController *)state {
    
}

@end
