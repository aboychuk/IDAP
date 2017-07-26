//
//  ABPurseObserver.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABPurseObserver.h"

@implementation ABPurseObserver

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.purse = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accesors

- (void)setPurse:(ABPurse *)purse {
    if (_purse != purse) {
        [_purse removeObserver:self];
        
        _purse = [purse retain];
        
        [purse addObserver:self];
    }
}

#pragma mark -
#pragma mark Protocol Methods

- (void)purseDidBecomeEmpty:(ABPurse *)purse {
    if (self.purse == purse) {
        NSLog(@"Purse is empty");
    }
}

- (void)purseDidBecomeNonEmpty:(ABPurse *)purse {
    if (self.purse == purse) {
        NSLog(@"Purse is non empty");
    }
}

@end
