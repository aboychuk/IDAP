//
//  ABCarWashController.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/21/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABWorker.h"
#import "ABCar.h"

@interface ABCarWashController : NSObject <ABWorkerObserver>

- (void)washCars:(NSArray *)cars;

@end
