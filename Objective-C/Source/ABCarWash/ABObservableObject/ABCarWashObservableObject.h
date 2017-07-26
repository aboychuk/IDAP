//
//  ABCarWashObservableObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCarWashObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, copy)     NSSet       *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObject:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;
- (void)notifyOfChangeState:(NSUInteger)state;


@end
