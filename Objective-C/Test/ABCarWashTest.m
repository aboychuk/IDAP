//
//  ABCarWashTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCarWashTest.h"


@implementation ABCarWashTest

+ (void)carWashTest {
    ABCarWash *carWashCompany = [[[ABCarWash alloc] init] autorelease];
    
    ABBuilding *administrativeBuilding = [[[ABBuilding alloc] init] autorelease];
    ABBuilding *carWashBuilding = [[[ABBuilding alloc] init] autorelease];
    
    ABRoom *officeRoom = [[[ABRoom alloc] init] autorelease];
    ABRoom *carWashRoom = [[[ABRoom alloc] init] autorelease];
    
    ABCarWasher *washer = [[[ABCarWasher alloc] init] autorelease];
    ABAcountant *accountant = [[[ABAcountant alloc] init] autorelease];
    ABDirector *director = [[[ABDirector alloc] init] autorelease];
    
    [carWashCompany addBuilding:administrativeBuilding];
    [carWashCompany addBuilding:carWashBuilding];
    
    [administrativeBuilding addRoom:officeRoom];
    [carWashBuilding addRoom:carWashRoom];
    
    [officeRoom addWorker:accountant];
    [officeRoom addWorker:director];
    [carWashRoom addWorker:washer];
    
    for (NSUInteger i = 0; i < 10; i++) {
        ABCar *car = [[ABCar new] autorelease];
        [carWashCompany addCar:car];
        [carWashCompany washing];
    }
}

@end
