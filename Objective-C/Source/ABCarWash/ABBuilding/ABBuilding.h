//
//  ABBuilding.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABRoom.h"
#import "ABCarWashRoom.h"

@interface ABBuilding : NSObject
@property (nonatomic, copy, readonly)   NSArray *rooms;

- (void)addRoom:(ABRoom *)room;
- (void)removeRoom:(ABRoom *)room;

- (ABWorker *)objectOfClassWorker:(Class)class;
- (ABCar *)objectOfClassCar:(Class)class;


@end

