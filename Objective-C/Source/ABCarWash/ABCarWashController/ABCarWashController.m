//
//  ABCarWashController.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/21/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashController.h"

#import "ABDispatcher.h"
#import "ABCar.h"
#import "ABCarWasher.h"
#import "ABAcountant.h"
#import "ABDirector.h"

#import "NSArray+ABExtension.h"

typedef NSArray*(^ABWorkerGenerator)(NSUInteger workerCount, Class workerCls, id workerObserver);

static NSUInteger       ABWashersCount = 10;
static NSUInteger       ABAccountantCount = 6;
static NSUInteger       ABDirectorCount = 1;

@interface ABCarWashController ()
@property (nonatomic, retain)   ABDispatcher    *washersDispatcher;
@property (nonatomic, retain)   ABDispatcher    *accountantDispatcher;
@property (nonatomic, retain)   ABDispatcher    *directorDispatcher;

@end

@implementation ABCarWashController

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
    ABDispatcher *washersDispatcher = self.washersDispatcher;
    ABDispatcher *accountantsDispatcher = self.accountantDispatcher;
    ABDispatcher *directorsDispatcher = self.directorDispatcher;
    
    ABWorkerGenerator generator = ^NSArray*(NSUInteger workerCount, Class workerCls, id workerObserver) {
        return [NSArray objectsWithCount:workerCount
                            factoryBlock:^id{
                                id worker = [workerCls object];
                                [worker addObserver:workerObserver];
                                
                                return worker;
                            }];
    };
    
    NSArray* washers = generator(ABWashersCount,[ABCarWasher class], accountantsDispatcher);
    NSArray* accountants = generator(ABAccountantCount, [ABAcountant class], directorsDispatcher);
    NSArray* directors = generator(ABDirectorCount, [ABDirector class], nil);
    
    [washersDispatcher addHandlers:washers];
    [accountantsDispatcher addHandlers:accountants];
    [directorsDispatcher addHandlers:directors];
}

@end
