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
    [carWashCompany startWashing];
}

@end
