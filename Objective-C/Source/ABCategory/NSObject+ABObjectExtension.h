//
//  NSObject+ABObjectExtension.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/16/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ABObjectExtension)

+ (instancetype)object;
+ (NSArray *)arrayOfObjects:(id)object withCount:(NSUInteger)count;

@end
