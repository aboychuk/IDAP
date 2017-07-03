//
//  ABGCDExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABGCDExtension.h"

@implementation ABGCDExtension

- (void)dispatchSyncOnMainThreadWithBlock:(ABVoidBlock)block {
    dispatch_sync(dispatch_get_main_queue(), block);
}

- (void)dispatchAsyncOnMainTheradWithBlock:(ABVoidBlock)block {
    dispatch_async(dispatch_get_main_queue(), block);
}

- (void)dispatchSyncInBackgroundThread:(dispatch_queue_t)queue block:(ABVoidBlock)block {
    dispatch_sync(queue, block);
}

- (void)dispatchAsyncInBackgroundThread:(dispatch_queue_t)queue block:(ABVoidBlock)block {
    dispatch_async(queue, block);
}

@end
