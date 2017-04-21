//
//  ABCreature.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 20.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCreature.h"

@implementation ABCreature

-(void)sayHello {
    NSLog(@"Hello from ABCreature!");
}

-(void)fight {
    NSLog(@"I can fight!");
}
-(void)addChildren {
    [self.children arrayByAddingObject:_children];
}

@end
