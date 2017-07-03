//
//  ABCarWashController.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABWorker.h"

@interface ABCarWashController : NSObject <ABWorkerObserver>
@property (nonatomic, assign, getter=isRunning) BOOL    running;

@end
