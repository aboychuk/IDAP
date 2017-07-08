//
//  ABGCDExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABGCDExtension.h"

@implementation ABGCDExtension

dispatch_queue_t createSerialDispatchQueue(NSString *label) {
    return dispatch_queue_create([label cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_SERIAL);
}

dispatch_queue_t createConcurrentDispatchQueue(NSString *label) {
    return dispatch_queue_create([label cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_CONCURRENT);
}

void dispatchAfterCount(NSUInteger count, dispatch_queue_t queue, dispatch_block_t block) {
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(count * NSEC_PER_SEC)), queue, block);
    }
}

void dispatchSyncOnMainThreadWithBlock(dispatch_block_t block) {
    if (block) {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void dispatchAsyncOnMainTheradWithBlock(dispatch_block_t block) {
    if (block) {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void dispatchSyncInBackgroundThread(dispatch_queue_t queue, dispatch_block_t block) {
    if (block) {
        dispatch_sync(queue, block);
    }
}

void dispatchAsyncInBackgroundThread(dispatch_queue_t queue, dispatch_block_t block) {
    if (block) {
        dispatch_async(queue, block);
    }
}

@end
