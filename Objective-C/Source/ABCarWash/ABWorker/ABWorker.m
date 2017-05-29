//
//  ABWorker.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABWorker.h"

@interface ABWorker ()
@property (nonatomic, assign)   NSUInteger  money;

@end

@implementation ABWorker

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    [self.name release];
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init{
    self = [super init];
    self.salary = 4000;
    self.experience = 5;
    
    return self;
}

#pragma mark
#pragma mark Public Methods

- (void)processObject:(id<ABMoneyFlow>)object {
    [self specificClassOperation:object];
    [self takeMoneyFromObject:object];
}

- (void)specificClassOperation:(id<ABMoneyFlow>)object {
    
}

#pragma mark
#pragma mark Private Methods

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

- (void)takeMoneyFromObject:(id<ABMoneyFlow>)object {
    self.money += [object giveMoney];
    NSLog(@"%@ got %lu USD from the %@",
          NSStringFromClass([self class]),
          self.money,
          NSStringFromClass([object class]));

}

@end
