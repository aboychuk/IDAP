//
//  ABAcountant.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAcountant.h"

@implementation ABAcountant

- (void)takeMoneyFromObject:(ABWorker *)washer {
    [super takeMoneyFromObject:washer];
    NSLog(@"Accountant got %lu from washer", self.money);
}

@end
