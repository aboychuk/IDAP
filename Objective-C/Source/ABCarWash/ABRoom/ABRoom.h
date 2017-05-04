//
//  ABRoom.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABHuman.h"

@interface ABRoom : NSObject
@property(nonatomic, assign)NSUInteger capacity;
@property(nonatomic, copy, readonly)NSArray *humans;

- (void)addHuman:(ABHuman *)human;
- (void)removeHuman:(ABHuman *)human;


@end
