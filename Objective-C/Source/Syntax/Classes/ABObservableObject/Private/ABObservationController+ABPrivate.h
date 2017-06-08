//
//  ABObservationController_ABPrivate.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservationController.h"

@interface ABObservationController ()

- (void)notifyWithState:(NSUInteger)state;
- (void)notifyWithState:(NSUInteger)state withObject:(id)object;


@end
