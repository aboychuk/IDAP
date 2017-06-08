//
//  ABObservationController.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABObservableObject.h"

@interface ABObservationController : NSObject
@property (nonatomic, readonly) id                  observer;
@property (nonatomic, readonly) ABObservableObject  *observableObject;

+ (instancetype)observationControllerWithObserver:(id)observer
                            observableObject:(ABObservableObject *)observableObject;

- (instancetype)initWithObserver:(id)observer
                observableObject:(ABObservableObject *)observableObject;

- (BOOL)isEqualToObservationState:(ABObservationController *)state;

@end
