//
//  ABCar.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCar : NSObject
typedef enum {dirty, clean} carPurity;

@property(nonatomic, assign)carPurity cleaness;
@property(nonatomic, assign)NSUInteger money;

- (instancetype)init;
- (NSUInteger)payForWash;

@end
