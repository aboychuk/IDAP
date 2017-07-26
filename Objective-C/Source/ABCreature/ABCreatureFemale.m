//
//  ABCreatureFemale.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 26.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreatureFemale.h"

@implementation ABCreatureFemale

- (void)childBirth {
    NSLog(@"%@ went to the maternity hospital", self.name);
}
- (void)performGenderSpecificOperation {
    [self childBirth];
}

@end
