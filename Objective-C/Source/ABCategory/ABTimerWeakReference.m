//
//  ABTimerWeakReference.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABTimerWeakReference.h"

@interface ABTimerWeakReference ()
@property (nonatomic, assign)   id    target;
@property (nonatomic, assign)   SEL   selector;

@end

@implementation ABTimerWeakReference

#pragma mark
#pragma mark Initializations and Deallocations

- (instancetype)initWithTarget:(id)aTarget selector:(SEL)aSelector {
    self = [super init];
    if (self) {
        self.target = aTarget;
        self.selector = aSelector;
    }
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)fireTimer:(NSTimer *)timer {
    id target = self.target;
    if (target) {
        [target performSelector:self.selector withObject:timer];
    } else {
        [timer invalidate];
    }
}

@end
