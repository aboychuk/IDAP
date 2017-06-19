//
//  ABQueue.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABQueue : NSArray
@property (nonatomic, readonly, getter=isEmpty)     BOOL        empty;
@property (nonatomic, readonly)                     NSUInteger  count;

- (void)addObjectToQueue:(id)object;
- (id)popObjectFromQueue;

@end
