//
//  ABPurse.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABPurse.h"

@implementation ABPurse

#pragma mark -
#pragma mark Accesors

- (void)setMoney:(NSUInteger)money {
    if (money != _money) {
        _money = money;
        
        self.state = (0 == money) ? ABPurseEmpty : ABPurseNonEmpty;
    }
}

#pragma mark - 
#pragma mark Overloaded Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABPurseEmpty:
            return @selector(purseDidBecomeEmpty:);
         
        case ABPurseNonEmpty:
            return @selector(purseDidBecomeNonEmpty:);
        
        default:
            return ([super selectorForState:state]);
    }
}


@end
