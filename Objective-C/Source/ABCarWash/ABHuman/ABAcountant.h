//
//  ABAcountant.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABWorker.h"

@interface ABAcountant : ABWorker
@property (nonatomic, assign)   NSUInteger  moneyForCount;

- (void)takeMoneyFromWasher:(NSUInteger)moneyFromWasher;
- (NSUInteger)giveMoneyToDirector;

@end
