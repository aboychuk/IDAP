//
//  NSTimer+ABWeakReferenceTimer.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSTimer+ABWeakReferenceTimer.h"

#import "ABTimerWeakReference.h"

@implementation NSTimer (ABWeakReferenceTimer)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                 weakTarget:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo {
    id weakTarget = [[[ABTimerWeakReference alloc] initWithTarget:aTarget selector:aSelector] autorelease];
    
    return [NSTimer scheduledTimerWithTimeInterval:ti
                                            target:weakTarget
                                          selector:@selector(fireTimer:)
                                          userInfo:userInfo
                                           repeats:yesOrNo];
    
}

@end
