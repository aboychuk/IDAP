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
#import "ABBuilding.h"
#import "ABCar.h"

@interface ABCarWash : NSObject
@property (nonatomic, copy, readonly)   NSArray *cars;
@property (nonatomic, copy, readonly)   NSArray *buildings;

- (void)addCar:(ABCar *)car;
- (void)removeCar:(ABCar *)car;

- (void)addBuilding:(ABBuilding *)building;
- (void)removeBuilding:(ABBuilding *)building;

- (void)washing;

@end
