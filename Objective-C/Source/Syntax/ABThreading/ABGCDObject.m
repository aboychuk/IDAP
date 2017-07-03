//
//  ABGCDObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABGCDObject.h"

static const uint32_t ABSecondsInSecond     = 1000 * 1000;
static const uint32_t ABMaxSleepDuration    = 1;
static size_t ABIterationsCount             = 500;

static NSString * const kABGCDQueue         = @"kABGCDQueue";

@interface ABGCDObject ()
@property (nonatomic, assign)   NSUInteger          sleepCount;
@property (nonatomic, assign)   NSUInteger          wakeUpCount;
@property (nonatomic, retain)   dispatch_queue_t    queue;

- (void)executeWithQueueType:(dispatch_queue_attr_t)attribute;

@end

@implementation ABGCDObject

#pragma mark
#pragma mark Accessors

- (void)setQueue:(dispatch_queue_t)queue {
    if (queue != _queue) {
        if (_queue) {
            dispatch_release(_queue);
        }
        _queue = queue;
        
        if (queue) {
            dispatch_retain(queue);
        }
    }
}

#pragma mark
#pragma mark Public Methods

- (void)executeSerial {
    [self executeWithQueueType:DISPATCH_QUEUE_SERIAL];
}

- (void)executeConcurent {
    [self executeWithQueueType:DISPATCH_QUEUE_CONCURRENT];
}

 #pragma mark
#pragma mark Private Methods

- (void)executeWithQueueType:(dispatch_queue_attr_t)attribute {
    dispatch_queue_t queue = dispatch_queue_create([kABGCDQueue cStringUsingEncoding:NSUTF8StringEncoding],
                                                   attribute);
    
    self.queue = queue;
    dispatch_release(queue);
    
    void (^block)(size_t) = ^(size_t count) {
        printf("Iteration start = %lu\n", count);

        dispatch_async(queue, ^{
            uint32_t time = arc4random_uniform(ABSecondsInSecond * ABMaxSleepDuration);
            self.sleepCount =+ 1;
            NSTimeInterval sleepDuration = (float)time / ABSecondsInSecond;
            
            printf("ID = %lu Sleep for %f seconds\n", count, sleepDuration);
            
            usleep(time);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                printf("ID = %lu Wake up after %f\n", count, sleepDuration);
                self.wakeUpCount =+ 1;
            });
        });
        printf("Iteration finish = %lu\n", count);
    };
    
    dispatch_async(queue, ^{
        dispatch_apply(ABIterationsCount, queue, block);
    });

}

@end
