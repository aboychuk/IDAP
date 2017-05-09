//
//  ABCarWasher.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABWorker.h"
#import "ABCar.h"

@interface ABCarWasher : ABWorker
@property (nonatomic, assign)   NSUInteger  paymentForWash;

- (void)washCar:(ABCar *)car;
- (void)takeMoneyFromCar:(NSUInteger)moneyFromCar;
- (NSUInteger)giveMoneyToAccountant;

@end
