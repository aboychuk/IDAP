//
//  ABWorker.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"
#import "ABMoneyFlow.h"

#import "NSString+ABExtensions.h"
#import "NSNumber+ABRandomNumber.h"

@interface ABWorker : ABCreature <ABMoneyFlow>
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;

- (void)processObject:(id<ABMoneyFlow>)object;
- (void)processScpecificOperations:(id<ABMoneyFlow>)object;

@end
