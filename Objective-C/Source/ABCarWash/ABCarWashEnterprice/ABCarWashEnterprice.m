//
//  ABCarWashEnterprice.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashEnterprice.h"

#import "ABDispatcher.h"
#import "ABCar.h"
#import "ABCarWasher.h"
#import "ABAcountant.h"
#import "ABDirector.h"

#import "NSArray+ABExtension.h"

typedef ABDispatcher*(^ABDispatcherGenerator)(NSUInteger workerCount, Class workerCls, ABDispatcher *workerObserver);

static NSUInteger ABWashersCount    = 10;
static NSUInteger ABAccountantCount = 6;
static NSUInteger ABDirectorCount   = 1;

@interface ABCarWashEnterprice ()
@property (nonatomic, retain)   ABDispatcher    *washersDispatcher;
@property (nonatomic, retain)   ABDispatcher    *accountantDispatcher;
@property (nonatomic, retain)   ABDispatcher    *directorDispatcher;

@end

@implementation ABCarWashEnterprice

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.washersDispatcher = nil;
    self.accountantDispatcher = nil;
    self.directorDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washersDispatcher = [ABDispatcher object];
        self.accountantDispatcher = [ABDispatcher object];
        self.directorDispatcher = [ABDispatcher object];
    }
    
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark
#pragma mark - Public Methods

- (void)processCars:(NSArray *)cars {
    for (ABCar *car in cars) {
        [self.washersDispatcher takeObjectForProcessing:car];
    }
}

#pragma mark
#pragma mark Private Methods

- (void)setCarWashHierarchy {
    ABDispatcherGenerator generator = ^ABDispatcher*(NSUInteger workerCount, Class workerCls, ABDispatcher *workerObserver) {
        ABDispatcher *dispatcher = [ABDispatcher object];
        
        NSArray *workers = [NSArray objectsWithCount:workerCount
                            factoryBlock:^id{
                                id worker = [workerCls object];
                                [worker addObserver:workerObserver];
                                
                                return worker;
                            }];
        
        [dispatcher addHandlers:workers];
        
        return dispatcher;
    };
    
    self.directorDispatcher = generator(ABDirectorCount, [ABDirector class], nil);
    self.accountantDispatcher = generator(ABAccountantCount, [ABAcountant class], self.directorDispatcher);
    self.washersDispatcher = generator(ABWashersCount, [ABCarWasher class], self.accountantDispatcher);

}


@end
