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

- (void)startWashing:(ABCar *)car {
    ABWorker *washer = [self workerWithClass:[ABCarWasher class]];
    ABWorker *accountant = [self workerWithClass:[ABAcountant class]];
    ABWorker *director = [self workerWithClass:[ABDirector class]];
    
    [washer processObject:car];
    [accountant processObject:washer];
    [director processObject:accountant];
}

#pragma mark
#pragma mark Private Methods

- (void)addBuilding:(ABBuilding *)building {
    if (building) {
        [self.mutableBuildings addObject:building];
    }
}

- (void)removeBuilding:(ABBuilding *)building {
    [self.mutableBuildings removeObject:building];
}

- (NSArray *)findWorkersOfClassInBuildings:(Class)cls {
    NSMutableArray *workers = [NSMutableArray array];
    for (ABBuilding *buildings in self.mutableBuildings) {
        [workers addObjectsFromArray:[buildings findWorkersOfClassInRooms:cls]];
    }
    return [NSArray arrayWithArray:workers];
}

- (ABWorker *)workerWithClass:(Class)cls {
    return [[self findWorkersOfClassInBuildings:cls] firstObject];
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
