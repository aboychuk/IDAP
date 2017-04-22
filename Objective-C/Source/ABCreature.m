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
    NSLog(@"Hello from %@ !", self.name);
}

-(void)fight {
    NSLog(@"%@ can fight!", self.name);
}
-(void)addChild:(ABCreature*)child {
    [self.children addObject:child];
}

-(void)deleteChild:(ABCreature*)child {
    [self.children removeObject:child];
}

@end
