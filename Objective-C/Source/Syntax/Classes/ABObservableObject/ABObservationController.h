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
@property (nonatomic, readonly)     id                  observer;
@property (nonatomic, readonly)     ABObservableObject  *observableObject;
@property (nonatomic, readonly, getter=isValid) BOOL    valid;


+ (instancetype)observationControllerWithObserver:(id)observer
                            observableObject:(ABObservableObject *)observableObject;

- (instancetype)initWithObserver:(id)observer
                observableObject:(ABObservableObject *)observableObject;

//Invalidates the Object. Notifications won't be passed through it and it will be removed frome observableObject at
// some point.
- (void)invalidate;

@end
