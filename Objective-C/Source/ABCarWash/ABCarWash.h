//
//  ABCarWash.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABCarWasher.h"
#import "ABAcountant.h"
#import "ABDirector.h"
#import "ABCar.h"

#import "NSObject+ABObjectExtension.h"
#import "NSArray+ABExtension.h"
#import "NSObject+ABRandomNumber.h"

@interface ABCarWash : NSObject

- (void)startWashing:(ABCar *)car;

@end
