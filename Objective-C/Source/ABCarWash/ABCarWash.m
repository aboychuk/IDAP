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
@property (nonatomic, retain)   NSMutableArray  *mutableCars;

@end

@implementation ABCarWash

@dynamic buildings;
@dynamic cars;


#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableBuildings = nil;
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableBuildings = [NSMutableArray array];
    self.mutableCars = [NSMutableArray array];
    [self setCarWashHierarchy];
    
    return self;
}

#pragma mark -
#pragma mark - Accessors

- (NSArray *)buildings {
    return [[self.mutableBuildings copy] autorelease];
}

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
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

- (void)addCar:(ABCar *)car {
    if (car) {
        [self.mutableCars addObject:car];
    }
}

- (void)removeCar:(ABCar *)car {
    [self.mutableCars removeObject:car];
}

- (void)startWashing {
    ABWorker *washer = [self findWorkerOfClass:[ABCarWasher class]];
    ABWorker *accountant = [self findWorkerOfClass:[ABAcountant class]];
    ABWorker *director = [self findWorkerOfClass:[ABDirector class]];
    //ABCar *car = [self findWorkerOfClass:[ABCar class]];
    
    for (ABCar *car in self.mutableCars) {
        [washer processObject:car];
        [accountant processObject:washer];
        [director processObject:accountant];
    }
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

- (void)setCarWashHierarchy {
    ABBuilding *administrativeBuilding = [[[ABBuilding alloc] init] autorelease];
    ABBuilding *carWashBuilding = [[[ABBuilding alloc] init] autorelease];
    
    ABRoom *officeRoom = [[[ABRoom alloc] init] autorelease];
    ABCarWashRoom *carWashRoom = [[[ABCarWashRoom alloc] init] autorelease];
    
    ABCarWasher *washer = [[[ABCarWasher alloc] init] autorelease];
    ABAcountant *accountant = [[[ABAcountant alloc] init] autorelease];
    ABDirector *director = [[[ABDirector alloc] init] autorelease];
    ABCar *car = [[ABCar new] autorelease];

    
    for (NSUInteger i = 0; i < 9; i++) {
        ABCar *car = [[ABCar new] autorelease];
        [self addCar:car];
    }
    
    [self addBuilding:administrativeBuilding];
    [self addBuilding:carWashBuilding];
    
    [administrativeBuilding addRoom:officeRoom];
    [carWashBuilding addRoom:carWashRoom];
    
    [officeRoom addWorker:accountant];
    [officeRoom addWorker:director];
    [carWashRoom addWorker:washer];
    [carWashRoom addCar:car];
}

- (NSArray *)arrayOfObjects:(id)object arrayWithCount:(NSUInteger)count {
    NSMutableArray *arrayOfObjects = [NSMutableArray array];
    for (NSUInteger index = 0; index < count; index++) {
        object = [[object new] autorelease];
        [arrayOfObjects addObject:object];
    }
    return arrayOfObjects;
}

@end
