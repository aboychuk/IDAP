//
//  ABAcountant.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAcountant.h"

@implementation ABAcountant

- (void)processObject:(ABWorker *)washer {
    [super takeMoneyFromObject:washer];
    [self calculateMoney];
}

- (void)calculateMoney {
    NSLog(@"ACCountan calculated money.");
}
@end
