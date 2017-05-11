//
//  ABCreature.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 20.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "NSString+ABRandomString.h"
#import "NSNumber+ABRandomNumber.h"

@interface ABCreature : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   double      weight;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, copy)     NSArray     *children;

- (void)addChild:(ABCreature *)child;
- (void)deleteChild:(ABCreature *)child;

- (void)sayHello;
- (void)performGenderSpecificOperation;

@end
