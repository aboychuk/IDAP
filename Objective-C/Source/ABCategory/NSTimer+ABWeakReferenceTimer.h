//
//  NSTimer+ABWeakReferenceTimer.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ABWeakReferenceTimer)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                     weakTarget:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo;

@end
