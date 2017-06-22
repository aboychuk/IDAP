//
//  ABCarWashController.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/21/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABWorker.h"

@interface ABCarWashController : NSObject <ABWorkerObserver>

- (void)createWashersQueue:(NSArray*)washers;
- (void)createCarsQueue:(NSArray*)cars;
- (void)washCars:(NSArray*)cars;

@end
