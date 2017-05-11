//
//  ABMoneyFlow.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ABMoneyFlow <NSObject>
@property (nonatomic, readonly)   NSUInteger  money;

- (NSUInteger)giveMoney;
- (void)takeMoney:(id)money;
- (void)takeMoneyFromObject:(id<ABMoneyFlow>)object;

@end
