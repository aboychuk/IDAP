//
//  ABObservableObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ABStateChangeHandler)(void);

@interface ABObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *obsrversSet;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObject:(id)observer;

- (void)addObserver:(id)observer
        withHandler:(ABStateChangeHandler)handler;

- (void)addObserver:(id)observer
        withHandler:(ABStateChangeHandler)handler
           forState:(NSUInteger)state;

- (void)removeObserver:(id)observer
              forState:(NSUInteger)state;

//This method is intendent for subclassing. Never call it directly.
- (SEL)selectorForState:(NSUInteger)state;

@end
