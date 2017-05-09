//
//  ABCar.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ABCleanOrDirty) {
    ABClean,
    ABDirty,
};

@interface ABCar : NSObject
@property (nonatomic, assign)   BOOL    cleaness;
@property (nonatomic, assign)   NSUInteger  money;

- (instancetype)init;
- (NSUInteger)payForWash;

@end
