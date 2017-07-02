//
//  ABCarWash.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABWorker.h"

@interface ABCarWash : NSObject <ABWorkerObserver>
@property (nonatomic, assign, getter=isRunning) BOOL    running;

- (void)washCars:(NSArray *)cars;
- (void)start;
- (void)stop;

@end
