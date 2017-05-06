//
//  ABDirector.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABHuman.h"

@interface ABDirector : ABHuman
@property(nonatomic, assign)NSUInteger profit;

- (void)takeMoneyFromAccountant:(NSUInteger)moneyFromAccountant;

@end
