//
//  main.m
//  Objective-C
//
//  Created by Andrew Boychuk on 19.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"
#import "ABCreatureTest.h"
#import "ABCreatureMale.h"
#import "ABCreatureFemale.h"
#import "NSObject+ABObjectExtension.h"
#import "ABCarWashTest.h"
#import "ABThreadUnsafeObject.h"
#import "ABGCDObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        ABThreadUnsafeObject *object = [[ABThreadUnsafeObject new] autorelease];
//        for (NSUInteger threadCount = 0; threadCount < 100; threadCount++) {
//            [object performSelectorInBackground:@selector(setValue:)
//                                     withObject:[[NSObject new] autorelease]];
//        }
//        
//        while (true) {
//            
//        }
        ABGCDObject *gcd = [ABGCDObject object];
        [gcd executeConcurent];
        
        NSRunLoop *runloop = [NSRunLoop mainRunLoop];
        [runloop run];
    }
    
    return 0;
}

