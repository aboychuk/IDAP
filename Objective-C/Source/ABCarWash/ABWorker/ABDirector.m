//
//  ABDirector.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDirector.h"

@implementation ABDirector

- (void)processObject:(ABWorker *)Accountant {
    [super takeMoneyFromObject:Accountant];
    [self gotProfit];
}
- (void)gotProfit {
    NSLog(@"Director got %lu", self.money);
}

@end
