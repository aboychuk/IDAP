//
//  ABCreatureMale.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 26.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreatureMale.h"

@implementation ABCreatureMale

- (void)goToWar {
    NSLog(@"%@ went to war!", self.name);
}

- (void)performGenderSpecificOperation {
    [self goToWar];
}

@end
