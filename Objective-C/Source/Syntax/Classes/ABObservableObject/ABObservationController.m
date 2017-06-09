//
//  ABObservationController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservationController.h"

#import "ABObservationController+ABPrivate.h"
#import "ABObservableObject+ABPrivate.h"

static NSString *kABObservationControllerAllocationException = @"ABObservationController should never be instantiated directly.";

@interface ABObservableObject ()
@property (nonatomic, assign) id                  observer;
@property (nonatomic, assign) ABObservableObject  *observableObject;

@end

@implementation ABObservationController

@dynamic valid;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)observationControllerWithObserver:(id)observer
                            observableObject:(ABObservableObject *)observableObject
{
    return [[[self alloc] initWithObserver:observer
                             observableObject:observableObject] autorelease];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    NSAssert([self class] != [ABObservationController class], kABObservationControllerAllocationException);
    
    return [super allocWithZone:zone];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.observer = nil;
    self.observableObject = nil;
    
    [super dealloc];
}

- (instancetype)initWithObserver:(id)observer
                observableObject:(ABObservableObject *)observableObject
{
    NSAssert(nil != observer, NSInvalidArgumentException);
    NSAssert(nil != observableObject, NSInvalidArgumentException);
    self = [self init];
    if (self) {
        self.observer = observer;
        self.observableObject = observableObject;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (void)setObservableObject:(ABObservableObject *)observableObject {

    
    if (nil == _observableObject) {
        [_observableObject invalidateController:self];
    }
    
    _observableObject = observableObject;
}

- (BOOL)isValid {
    return nil != self.observableObject || nil != self.observer;
}

#pragma mark -
#pragma mark Public Methods

- (void)invalidate {
    self.observableObject = nil;
    self.observer = nil;
}

- (NSUInteger)hash {
    return [[self class] hash] ^ [self.observer hash] ^ [self.observableObject hash];
}

- (BOOL)isEqual:(ABObservationController *)controller {
    if (!controller) {
        return NO;
    }
    
    if (controller == self) {
        return YES;
    }
    
    if ([self isMemberOfClass:[controller class]]) {
        return controller.observer == self.observer
            && controller.observableObject == self.observableObject;
    }
    
    return NO;
}

#pragma mark -
#pragma mark Private Methods

- (void)notifyWithState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)notifyWithState:(NSUInteger)state withObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

@end
