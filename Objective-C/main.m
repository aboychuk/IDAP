//
//  main.m
//  Objective-C
//
//  Created by Andrew Boychuk on 19.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObjCSyntax.h"

#import "ABSyntax.h"
#import "ABSyntaxSubclass.h"

#import "ABSyntax+ABCategory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ABObjCSyntax();
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
        
    }

    return 0;
}
