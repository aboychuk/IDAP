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

dispatch_queue_t ABQueueInBackgroundThread() {
    return ABQueueWithQOSClass(QOS_CLASS_BACKGROUND);
}

dispatch_queue_t ABQueueOnMainThread() {
    return dispatch_get_main_queue();
}

void ABDispatchSyncOnMainThreadWithBlock(dispatch_block_t block) {
    if (block) {
        if ([[NSThread currentThread] isMainThread]) {
            block();
        } else {
            dispatch_sync(ABQueueOnMainThread(), block);
        }
    }
}

void ABDispatchAsyncOnMainThread(dispatch_block_t block) {
    if (block) {
        dispatch_async(ABQueueOnMainThread(), block);
    }
}

void ABDispatchSyncInBackgroundThread(dispatch_block_t block) {
    if (block) {
        dispatch_sync(ABQueueInBackgroundThread(), block);
    }
}

void ABDispatchAsyncInBackgroundThread(dispatch_block_t block) {
    if (block) {
        dispatch_async(ABQueueInBackgroundThread(), block);
    }
}

void ABDispatchAfterDelay(NSUInteger delay, dispatch_block_t block) {
    if (block) {
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
        dispatch_after(when, ABQueueInBackgroundThread(), block);
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
