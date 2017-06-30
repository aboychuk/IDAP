//
//  ABTimerWeakReference.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABTimerWeakReference : NSObject
- (instancetype)initWithTarget:(id)aTarget selector:(SEL)aSelector;
- (void)fireTimer:(NSTimer *)timer;

@end
