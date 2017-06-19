//
//  ABWorker.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashObservableObject.h"
#import "ABMoneyFlow.h"
#import "ABQueue.h"

#import "NSString+ABExtensions.h"
#import "NSObject+ABRandomNumber.h"
#import "NSObject+ABObjectExtension.h"

@class ABWorker;

typedef NS_ENUM(NSUInteger, ABWorkerState) {
    ABWorkerBusy,
    ABWorkerReadyForProcess,
    ABWorkerFree
};

@protocol ABWorkerObserver <NSObject>
@optional

- (void)workerDidBecomeBusy:(id <ABMoneyFlow>) object;
- (void)workerDidBecomeFree:(id <ABMoneyFlow>) object;
- (void)objectDidBecomeReadyForProcess:(id<ABMoneyFlow>)object;

@end

@interface ABWorker :  ABCarWashObservableObject <ABMoneyFlow, ABWorkerObserver>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;
@property (nonatomic, retain)   ABQueue         *queue;

- (void)processObject:(id<ABMoneyFlow>)object;
//Methodes for override;
- (void)finishProcessingObject:(id)object;
- (void)finishProcess;

@end
