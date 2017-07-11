//
//  ABGCDExtension.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^ABConditionBlock)(void);

@interface ABGCDExtension : NSObject

dispatch_queue_t ABCreateSerialDispatchQueue();
dispatch_queue_t ABCreateConcurrentDispatchQueue();

dispatch_queue_t ABDispatchQueueWithQOSClass (long cls);
dispatch_queue_t ABDispatchBackgroundQueue();
dispatch_queue_t ABDispatchMainQueue();

void ABDispatchSyncOnMainThread(dispatch_block_t block);
void ABDispatchAsyncOnMainTherad(dispatch_block_t block);
void ABDispatchSyncInBackgroundThread(dispatch_block_t block);
void ABDispatchAsyncInBackgroundThread(dispatch_block_t block);

void ABDispatchAfterDelay(NSUInteger delay, dispatch_block_t block);
void ABDispatchAfterDelayWithCondition(NSUInteger delay, dispatch_block_t block, ABConditionBlock conditionBlock);

@end
