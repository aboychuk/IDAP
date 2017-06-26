//
//  ABDispatcher.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/25/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABWorker.h"

@interface ABDispatcher : NSObject

- (void)addHandler:(id)handler;
- (void)addHandlers:(NSArray *)handlers;
- (void)removeHandler:(id)handler;

- (void)takeObjectForProcessing:(id<ABMoneyFlow>)object;

@end
