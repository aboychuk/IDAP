//
//  NSArray+ABExtension.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/18/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ABExtension)

+ (NSArray *)objectsWithCount:(NSUInteger)count factoryBlock:(id(^)())block;
- (instancetype)filteredObjectsWithClass:(Class)cls;

@end
