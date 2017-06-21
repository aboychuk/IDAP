//
//  ABCarWashController.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/21/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCarWashController : NSObject

- (void)createWashersQueue:(NSArray*)washers;
- (void)createCarsQueue:(NSArray*)cars;
- (void)washCars;

@end
