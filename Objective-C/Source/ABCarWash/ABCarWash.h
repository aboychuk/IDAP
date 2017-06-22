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
#import "ABQueue.h"

#import "NSObject+ABObjectExtension.h"
#import "NSArray+ABExtension.h"
#import "NSObject+ABRandomNumber.h"

@interface ABCarWash : NSObject <ABWorkerObserver>

- (void)washCar:(NSArray *)cars;

@end
