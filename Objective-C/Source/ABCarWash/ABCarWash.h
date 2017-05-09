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
@property (nonatomic, copy, readonly)   NSArray *buildings;

- (void)addBuilding:(ABBuilding *)building;
- (void)removeBuilding:(ABBuilding *)building;

@end
