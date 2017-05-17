//
//  ABDirector.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDirector.h"

@implementation ABDirector

#pragma mark
#pragma mark Private Methods

- (void)processObject:(ABWorker *)Accountant {
    [self gotProfit];
}

- (void)gotProfit {
    NSLog(@"Director got %lu", self.money);
}

@end
