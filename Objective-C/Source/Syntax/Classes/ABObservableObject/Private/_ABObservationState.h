//
//  _ABObservationState.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABObservableObject.h"

typedef NS_ENUM(uint8_t, _ABObservationType) {
    _ABProtocolObservation,
    _ABHandlerObservation
};

@interface _ABObservationState : NSObject
@property (nonatomic, readonly) id                  observer;
@property (nonatomic, readonly) _ABObservationType  observationType;

+ (instancetype)observationStateWithObserver:(id)observer;

- (instancetype)initWithObserver:(id)observer;

- (void)setHandler:(ABStateChangeHandler)handler forState:(NSUInteger)state;
- (void)removeHandlerForState:(NSUInteger)state;
- (ABStateChangeHandler)handlerForState:(NSUInteger)state;
- (BOOL)containsHandlerForState:(NSUInteger)state;

- (void)notifyWithState:(NSUInteger)state;

- (BOOL)isEqualToObservationState:(_ABObservationState *)state;

@end
