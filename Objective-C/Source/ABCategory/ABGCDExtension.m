//
//  ABGCDExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABGCDExtension.h"

@implementation ABGCDExtension

id createSerialDispatchQueue(NSString *label) {
    return dispatch_queue_create([label cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_SERIAL);
}

id createConcurrentDispatchQueue(NSString *label) {
    return dispatch_queue_create([label cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_CONCURRENT);
}

void releaseDispatchQueue(dispatch_queue_t queue) {
    dispatch_release(queue);
}

void dispatchSyncOnMainThreadWithBlock(dispatch_block_t block) {
    dispatch_sync(dispatch_get_main_queue(), block);
}

void dispatchAsyncOnMainTheradWithBlock(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void dispatchSyncInBackgroundThread(dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_sync(queue, block);
}

void dispatchAsyncInBackgroundThread(dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_async(queue, block);
}

@end
