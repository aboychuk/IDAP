//
//  ABSyntax+ABCategory.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 24.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSyntax+ABCategory.h"

@implementation ABSyntax (ABCategory);
- (void)sayHiFromCategory {
    [self sayHi];
    [self sayWithString:[self text] name:@"ABCategory"];
}

@end

