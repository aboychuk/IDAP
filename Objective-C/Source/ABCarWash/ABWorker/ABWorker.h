//
//  ABWorker.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"
#import "ABMoneyFlow.h"

@interface ABWorker : ABCreature <ABMoneyFlow>
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;

- (void)takeMoneyFromObject:(id<ABMoneyFlow>)object;

@end
