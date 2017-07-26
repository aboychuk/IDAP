//
//  NSArray+ABExtension.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/18/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^ABFactoryBlock)(void);
typedef BOOL(^ABBoolBlock)(id);

@interface NSArray (ABExtension)

+ (NSArray *)objectsWithCount:(NSUInteger)count factoryBlock:(ABFactoryBlock)factoryBlock;

- (instancetype)objectsWithClass:(Class)cls;
- (instancetype)filteredObjectsWithClass:(Class)cls;
- (instancetype)filteredArrayWithBlock:(ABBoolBlock)boolBlock;


@end
