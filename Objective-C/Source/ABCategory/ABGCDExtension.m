//
//  ABGCDExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABGCDExtension.h"

//typedef BOOL(^ABConditionBlock)(void);

static NSString *ABSerial       = @"GCDSerialQueue";
static NSString *ABConcurrent   = @"GCDConcurrentQueue";

@implementation ABGCDExtension

dispatch_queue_t ABQueueSerial() {
    return dispatch_queue_create([ABSerial cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_SERIAL);
}

dispatch_queue_t ABQueueConcurrent() {
    return dispatch_queue_create([ABConcurrent cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_CONCURRENT);
}

dispatch_queue_t ABQueueWithQOSClass (long cls) {
    return dispatch_get_global_queue(cls, 0);
}

dispatch_queue_t ABBackgroundThreadQueue() {
    return ABQueueWithQOSClass(QOS_CLASS_BACKGROUND);
}

dispatch_queue_t ABMainThreadQueue() {
    return dispatch_get_main_queue();
}

void ABDispatchSyncOnMainThreadWithBlock(dispatch_block_t block) {
    if (block) {
        if ([[NSThread currentThread] isMainThread]) {
            block();
        } else {
            dispatch_sync(ABMainThreadQueue(), block);
        }
    }
}

void ABDispatchAsyncOnMainThread(dispatch_block_t block) {
    if (block) {
        dispatch_async(ABMainThreadQueue(), block);
    }
}

void ABDispatchAsyncInBackgroundThread(BOOL async, dispatch_block_t block) {
    if (block) {
        if (async) {
            dispatch_async(ABBackgroundThreadQueue(), block);
        } else {
            dispatch_sync(ABBackgroundThreadQueue(), block);
        }
    }
}

void ABDispatchAfterDelay(NSUInteger delay, dispatch_block_t block) {
    if (block) {
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
        dispatch_after(when, ABBackgroundThreadQueue(), block);
    }
}

void ABDispatchAfterDelayWithCondition(NSUInteger delay, dispatch_block_t block, ABConditionBlock conditionBlock) {
    ABDispatchAfterDelay(delay, ^{
        if (conditionBlock) {
            block();
            ABDispatchAfterDelayWithCondition(delay, block, conditionBlock);
        }
    });
}

@end
