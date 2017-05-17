//
//  ABSyntaxTest.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 26.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSyntaxTest.h"

@implementation ABSyntaxTest

void SyntaxTest() {
    NSObject *object = [ABSyntax alloc];
    object = [[object init] autorelease];
    
    ABSyntax *syntax = [ABSyntax syntax];
    //syntax.integerValue = 1;
    
    ABSyntax *subclass = [ABSyntaxSubclass syntax];
    
    [syntax sayHi];
    
    [subclass sayHi];
    
    [syntax sayHiFromCategory];
    
    [subclass sayHiFromCategory];
    
    //[subclass rapeMe];
    
    NSLog(ABOutputDelimiter);
    
    [syntax print];
    [subclass print];
    
    [syntax overloadedPrint];
    [subclass overloadedPrint];
    
    ABObjCSyntax();
}

@end
