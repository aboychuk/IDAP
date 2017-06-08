//
//  ABQueue.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABQueue : NSObject
@property (nonatomic, copy)     NSArray     *queue;

- (void)enqueue:object;
- (void)dequeue:object;
- (NSUInteger)objectsCount;

@end
