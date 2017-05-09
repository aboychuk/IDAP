//
//  ABDirector.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABWorker.h"

@interface ABDirector : ABWorker
@property (nonatomic, assign)   NSUInteger  profit;

- (void)takeMoneyFromAccountant:(NSUInteger)moneyFromAccountant;

@end
