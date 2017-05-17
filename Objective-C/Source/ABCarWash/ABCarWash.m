//
//  ABCarWash.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWash.h"

@interface ABCarWash ()
@property (nonatomic, retain)   NSMutableArray  *mutableBuildings;

@end

@implementation ABCarWash

@dynamic buildings;


#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableBuildings = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableBuildings = [NSMutableArray array];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark -
#pragma mark - Accessors

- (NSArray *)buildings {
    return [[self.mutableBuildings copy] autorelease];
}

#pragma mark
#pragma mark Public Methods

- (void)addBuilding:(ABBuilding *)building {
    if (building) {
    [self.mutableBuildings addObject:building];
    }
}

- (void)removeBuilding:(ABBuilding *)building {
    [self.mutableBuildings removeObject:building];
}

- (void)startWashing:(ABCar *)car {
    ABWorker *washer = [self findWorkerOfClass:[ABCarWasher class]];
    ABWorker *accountant = [self findWorkerOfClass:[ABAcountant class]];
    ABWorker *director = [self findWorkerOfClass:[ABDirector class]];
    
    [washer processObject:car];
    [accountant processObject:washer];
    [director processObject:accountant];
}

#pragma mark
#pragma mark Private Methods

- (ABWorker *)findWorkerOfClass:(Class)class {
    for (ABBuilding *building in self.mutableBuildings) {
        ABWorker *workerOfClass = [building objectOfClassWorker:class];
        if (workerOfClass) {
            return workerOfClass;
        }
    }
    return nil;
}

- (ABCar *)findCarOfClass:(Class)class {
    for (ABBuilding *building in self.mutableBuildings) {
        ABCar *carOfClass = [building objectOfClassCar:class];
        if (carOfClass) {
            return carOfClass;
        }
    }
    
    return nil;
}

- (void)setCarWashHierarchy {
    ABBuilding *administrativeBuilding = [ABBuilding object];
    ABBuilding *carWashBuilding = [ABBuilding object];
    
    ABRoom *officeRoom = [ABRoom object];
    ABCarWashRoom *carWashRoom = [ABCarWashRoom object];
    
    ABCarWasher *washer = [ABCarWasher object];
    ABAcountant *accountant = [ABAcountant object];
    ABDirector *director = [ABDirector object];
    
    [self addBuilding:administrativeBuilding];
    [self addBuilding:carWashBuilding];
    
    [administrativeBuilding addRoom:officeRoom];
    [carWashBuilding addRoom:carWashRoom];
    
    [officeRoom addWorker:accountant];
    [officeRoom addWorker:director];
    [carWashRoom addWorker:washer];
}

@end
