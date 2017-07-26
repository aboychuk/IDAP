//
//  ABCar.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABMoneyFlow.h"

typedef NS_ENUM(NSUInteger, ABCarState) {
    ABCarStateClean,
    ABCarStateDirty,
};

@interface ABCar : NSObject <ABMoneyFlow>
@property (nonatomic, assign)   ABCarState    state;

- (NSUInteger)giveMoney;

@end

