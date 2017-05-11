//
//  ABDirector.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDirector.h"

@implementation ABDirector

- (void)takeMoneyFromObject:(id<ABMoneyFlow>)Accountant {
    [super takeMoneyFromObject:Accountant];
    NSLog(@"Director got profit: %lu", self.money);
}

@end
