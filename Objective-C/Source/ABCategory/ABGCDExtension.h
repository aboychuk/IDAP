//
//  ABGCDExtension.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ABVoidBlock)(void);

@interface ABGCDExtension : NSObject

+ (void)dispatchSyncOnMainThreadWithBlock:(ABVoidBlock)block;
+ (void)dispatchAsyncOnMainTheradWithBlock:(ABVoidBlock)block;

+ (void)dispatchSyncInBackgroundThread:(dispatch_queue_t)queue block:(ABVoidBlock)block;
+ (void)dispatchAsyncInBackgroundThread:(dispatch_queue_t)queue block:(ABVoidBlock)block;

@end
