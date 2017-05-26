//
//  ABSyntaxSubclass.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 24.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSyntaxSubclass.h"

@implementation ABSyntaxSubclass

- (void)sayWithString:(NSString *)string name:(NSString *)name {
    NSLog(@"You are an asshole!!! %@", self);
}

- (void)rapeMe {
    NSLog(@"Rape Me!!! %@", self);
}

- (void)overloadedPrint {
    NSLog(ABOutputDelimiter);
    NSLog(@"%@ %s line = %d", self, __FILE__, __LINE__);
    [super overloadedPrint];
    NSLog(ABOutputDelimiter);
}

@end
