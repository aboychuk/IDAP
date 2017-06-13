//
//  ABQueue.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABQueue : NSArray
@property (nonatomic, copy)     NSArray     *queue;
@property (nonatomic, readonly, getter=isEmpty)   BOOL        empty;

- (void)addObjectToQueue:(id)object;
- (void)removeObjectFromQueue:(id)object;
- (id)popObjectFromQueue;
- (NSUInteger)count;

@end
