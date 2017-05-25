//
//  ABWorker.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"
#import "ABMoneyFlow.h"

#import "NSString+ABRandomString.h"
#import "NSNumber+ABRandomNumber.h"

@interface ABWorker : ABCreature <ABMoneyFlow>
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;

- (void)processObject:(id<ABMoneyFlow>)object;
- (void)specificClassOperation:(id<ABMoneyFlow>)object;

@end
