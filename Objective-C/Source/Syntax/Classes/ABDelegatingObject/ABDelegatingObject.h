//
//  ABDelegatingObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ABDelegatingObject;

@protocol ABDelegatingObjectDelegate <NSObject>

- (void)delegatingObject:(ABDelegatingObject *)object didChangeState:(NSUInteger)state;

@optional
- (BOOL)delegatingObjectShouldChangeState:(ABDelegatingObject *)object;

@end

@interface ABDelegatingObject : NSObject
@property(nonatomic, assign)    NSUInteger  state;
@property(nonatomic, assign)    id<ABDelegatingObjectDelegate>  delegate;

@end
