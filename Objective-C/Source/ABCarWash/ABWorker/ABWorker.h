//
//  ABWorker.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"
#import "ABMoneyFlow.h"

#import "NSString+ABExtensions.h"
#import "NSObject+ABRandomNumber.h"

@class ABWorker;

typedef NS_ENUM(NSUInteger, ABWorkerState) {
    ABWorkerBusy,
    ABWorkerFree
};

@protocol ABWorkerObserver <NSObject>
@optional

- (void)workerDidStartWork:(id <ABMoneyFlow>) worker;
- (void)workerDidFinishWork:(id <ABMoneyFlow>) worker;

@end

@interface ABWorker :  ABObservableObject <ABMoneyFlow, ABWorkerObserver>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;

- (void)processObject:(id<ABMoneyFlow>)object;

@end
