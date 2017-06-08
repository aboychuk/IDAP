//
//  ABBlockObservationController.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservationController.h"

@interface ABBlockObservationController : ABObservationController

- (void)setHandler:(ABStateChangeHandler)handler forState:(NSUInteger)state;
- (void)removeHandlerForState:(NSUInteger)state;
- (ABStateChangeHandler)handlerForState:(NSUInteger)state;
- (BOOL)containsHandlerForState:(NSUInteger)state;

@end
