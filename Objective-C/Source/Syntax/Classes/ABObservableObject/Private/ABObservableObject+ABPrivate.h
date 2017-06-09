//
//  ABObservableObject+ABPrivate.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

@class ABObservationController

@interface ABObservableObject ()

- (void)invalidateController:(ABObservationController *)controller;

@end
