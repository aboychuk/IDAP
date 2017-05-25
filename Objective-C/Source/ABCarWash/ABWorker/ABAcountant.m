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
    [self takeMoneyFromObject:washer];
    [self specificClassOperation:washer];
}
- (void)specificClassOperation:(id<ABMoneyFlow>)object {
    NSLog(@"Accountant calculated money.");
}

@end
