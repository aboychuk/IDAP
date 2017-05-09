//
//  ABHuman.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABHuman.h"

@implementation ABHuman

#pragma mark
#pragma mark Initializations and Dealocations

- (void)dealloc {
    [self.name release];
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init{
    self = [super init];
    self.name = @"ALex";
    self.salary = 4000;
    self.experience = 5;

    return self;
}

@end
