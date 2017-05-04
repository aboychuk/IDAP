//
//  ABCarWashRoom.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABRoom.h"
#import "ABCar.h"

@interface ABCarWashRoom : ABRoom
@property(nonatomic, copy)NSArray *cars;

- (void)addCar:(ABCar *)car;
- (void)removeCar:(ABCar *)car;

@end
