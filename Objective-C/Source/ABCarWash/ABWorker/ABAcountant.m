//
//  ABAcountant.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAcountant.h"

@implementation ABAcountant

#pragma mark
#pragma mark Private Methods

- (void)processObject:(ABWorker *)washer {
    [self calculateMoney];
}

- (void)calculateMoney {
    NSLog(@"Accountant calculated money.");
}
@end
